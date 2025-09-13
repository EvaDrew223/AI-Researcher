# ai_researcher/src/arxiv_provider.py
from __future__ import annotations
import arxiv
from typing import List, Dict

def search_arxiv(
    query: str,
    categories: List[str] | None = None,
    max_results: int = 100,
) -> List[Dict]:
    """
    Query arXiv and return records in the same general shape the pipeline expects.
    """
    # Build category filter, e.g., cond-mat.supr-con OR cond-mat.mtrl-sci
    cat = " OR ".join([f"cat:{c.strip()}" for c in (categories or [])])
    q = f"({query})" if not cat else f"({query}) AND ({cat})"

    # arXiv recommends <= 1 request / 3 seconds; the client enforces delay.   [oai_citation:2‡lukasschwab.me](https://lukasschwab.me/arxiv.py/?utm_source=chatgpt.com)
    client = arxiv.Client(page_size=100, delay_seconds=3, num_retries=3)
    search = arxiv.Search(
        query=q,
        max_results=max_results,
        sort_by=arxiv.SortCriterion.SubmittedDate,
        sort_order=arxiv.SortOrder.Descending,
    )

    out = []
    try:
        for r in client.results(search):
            arxiv_id = r.entry_id.split("/")[-1]  # e.g., 2501.01234
            out.append({
                "source": "arxiv",
                "paperId": f"arxiv:{arxiv_id}",
                "title": r.title,
                "abstract": r.summary,
                "year": r.published.year if r.published else None,
                "venue": "arXiv",
                "authors": [a.name for a in r.authors],
                "url": r.entry_id,
                "doi": r.doi,
            })
    except Exception as e:
        print(f"Error searching arXiv: {e}")
        return []
    return out
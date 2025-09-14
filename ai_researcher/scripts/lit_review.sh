## example usage
python3 src/lit_review.py \
 --engine "claude-3-5-haiku-20241022" \
 --mode "topic" \
 --topic_description "$(cat topics/nqs_topic.txt)" \
 --cache_name "../cache_results_test/lit_review/nqs_s2only_haiku.json" \
 --max_paper_bank_size 50 \
 --sources "s2,arxiv" \
 --arxiv_categories "cond-mat.supr-con,cond-mat.str-el" \
 --arxiv_max_results 50 \
 --print_all




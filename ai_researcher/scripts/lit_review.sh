## example usage
python3 src/lit_review.py \
 --engine "claude-3-5-haiku" \
 --mode "topic" \
 --topic_description "Neural-network wavefunction methods for quantum many-body systems (cond-mat + quant-ph), focusing on classical representations of the wavefunction trained via VMC / likelihood / REINFORCE. Include RBM/NQS, Slater-Jastrow-backflow + NN, fermionic neural nets (FermiNet, PauliNet), autoregressive/attention models (NAQS, "Transformer NQS", masked/self-attention, flow-assisted Transformers), normalizing flows for |psi|^2, and score/diffusion and Schrödinger-bridge/flow-matching approaches. Cover lattice and continuum fermions; targets = ground-state energies/observables, with excited states and dynamics when available. Compare against tensor networks (MPS/DMRG/PEPS), exact diagonalization, and mean-field baselines; cross-reference applications (Hubbard, Heisenberg, moire). Exclude quantum-hardware/circuit topics (VQE, QAOA, quantum circuits) and generic "quantum neural networks" not used as classical wavefunction models. Timeframe: 2017-present" \
 --cache_name "../cache_results_test/lit_review/nqs_s2only_haiku.json" \
 --max_paper_bank_size 50 \
 --sources "s2" \
 --print_all



#  --arxiv_categories "cond-mat.supr-con,cond-mat.str-el" \
#  --arxiv_max_results 50 \
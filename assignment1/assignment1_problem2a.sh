#!/bin/bash

#SBATCH --job-name=assignment1_p2a
#SBATCH --output=assignment1_problem2a.out
#SBATCH --error=assignment1_problem2a.err
#SBATCH --time=00:05:00

set -euo pipefail

JOB_DIR="${SLURM_SUBMIT_DIR:-$(pwd)}"
cd "$JOB_DIR"

apptainer exec "$JOB_DIR/assignment1.sif" bash -c '
echo "Kernel version: $(uname -r)"
echo "Python 3 version: $(python3 --version | awk "{print \$2}")"
echo "CPU model: $(grep -m 1 "model name" /proc/cpuinfo | cut -d ":" -f2 | xargs)"
'

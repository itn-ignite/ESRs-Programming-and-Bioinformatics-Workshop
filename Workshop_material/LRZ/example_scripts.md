#### IVYMUC (do not specify memory SBATCH --mem=448gb) ( --time=72:00:00 )

```bash
#!/bin/bash 
#SBATCH --job-name=metawrap
#SBATCH --output=output_metawrap.%j.%N.log
#SBATCH --error=error_metawrap.%j.%N.log
#SBATCH --get-user-env 
#SBATCH --clusters=ivymuc 
#SBATCH --nodes=7
#SBATCH --cpus-per-task=16
#SBATCH --ntasks-per-node=1
#SBATCH --mail-user=user@lrz.uni-muenchen.de
#SBATCH --mail-type=ALL
#SBATCH --time=72:00:00 

#############################################################
```

#### MPP3 (--time=48:00:00 )
```bash
#!/bin/bash 
#SBATCH --job-name=metawrap
#SBATCH --output=output_metawrap.%j.%N.log
#SBATCH --error=error_metawrap.%j.%N.log
#SBATCH --get-user-env 
#SBATCH --clusters=mpp3
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=64
#SBATCH --mail-user=user@lrz.uni-muenchen.de
#SBATCH --mail-type=ALL 
#SBATCH --time=48:00:00 

#############################################################
```

#### TERAMEM (--time=48:00:00 )
```bash
#!/bin/bash 
#SBATCH --job-name=trans_pipeline
#SBATCH --output=output_trans_pipeline.%j.%N.log
#SBATCH --error=error_trans_pipeline.%j.%N.log
#SBATCH --get-user-env 
#SBATCH --clusters=inter
#SBATCH --partition=teramem_inter
#SBATCH --nodes=1
#SBATCH --cpus-per-task=96
#SBATCH --ntasks-per-node=1
#SBATCH --mem=2000gb
#SBATCH --mail-user=user@lrz.uni-muenchen.de
#SBATCH --mail-type=ALL
#SBATCH --time=48:00:00

#############################################################
```


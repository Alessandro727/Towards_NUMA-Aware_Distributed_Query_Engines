# Towards NUMA-Aware Distributed Query Engines
<a name="readme-top"></a>

Systematic experimental study and investigation of the efficiency of resource utilisation by distributed query engines. 

The code and scripts provided allow the replication of the experiments shown in the 'Towards NUMA-Aware Distributed Query Engines' paper currently under review for ICDE2023.

## Getting Started

These instructions will give you the opportunity to replicate the experiments performed on your own local machines.
For each system evaluated, there is a brief guide inside each folder on how to install the additional requirements and run the test.


### Prerequisites

* Linux 16.04.
* Java 8 Update 151 or higher (8u151+), 64-bit. Both Oracle JDK and OpenJDK are supported.
* User with passwordless sudo access.
* Each machine in the cluster must be able to access via ssh without using a password each machine (including the local machine: e.g., user@mac01:~$ ssh 127.0.0.1) 

### Installing

To install, run the following script:

    user@mac01:~$ ./install_requirements.sh


## Contact

Alessandro Fogli - a.fogli18@imperial.ac.uk

<p align="right">(<a href="#readme-top">back to top</a>)</p>
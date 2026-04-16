# Cloud-Native FastAPI Application (AWS ECS Fargate)

Dit project is een volledig cloud-native applicatie die ik heb gebouwd en gedeployed op AWS.  
Het doel van dit project was om te laten zien hoe je een moderne, schaalbare en veilige infrastructuur opzet zoals bedrijven dat in de praktijk doen.


#  Wat doet dit project?

Dit is een backend API (FastAPI) waarmee je blogs kunt beheren.  
De applicatie draait volledig in de cloud en is bereikbaar via een eigen domein:

   https://api.hashim-next-gen.com

   https://api.hashim-next-gen.com/health



# Waarom heb ik dit project gemaakt?

Veel applicaties draaien nog lokaal of op simpele servers.  
Dat zorgt vaak voor problemen zoals:

   Niet schaalbaar ❌  
   Handmatige deployments ❌  
   Onveilige configuratie ❌  
   Moeilijk onderhoud ❌  

Met dit project heb ik laten zien hoe je dit oplost met moderne cloud technieken.



# Architectuur Diagram

De applicatie bestaat uit meerdere onderdelen:

      **Application Load Balancer (ALB)**  
  Zorgt ervoor dat verkeer veilig en efficiënt naar de app gaat (met HTTPS)

    **ECS Fargate (containers)**  
  Draait de applicatie zonder dat je servers hoeft te beheren

      **Docker**  
  Verpakt de applicatie zodat hij overal hetzelfde werkt

      **RDS PostgreSQL**  
  Database voor opslag van data

      **Secrets Manager**  
  Beheert gevoelige data zoals database wachtwoorden

      **Route53 + ACM**  
  Zorgt voor domein + HTTPS certificaat

      **Terraform**  
  Bouwt de hele infrastructuur automatisch (Infrastructure as Code)

      **GitHub Actions (CI/CD)**  
  Zorgt voor automatische deployments

  # Screenshots

## ECS Service Running
![ECS](./docs/ecs-running.png)

## Load Balancer Health
![ALB](./docs/alb-health.png)

## CloudWatch Logs
![Logs](./docs/cloudwatch-logs.png)

## API Response
![API](./docs/api-response.png)



#  Wat maakt dit project bijzonder?

Dit is geen simpele demo maar een end-to-end cloud setup

✅ Volledige infrastructuur met Terraform  
✅ Containerized applicatie (Docker)  
✅ Serverless containers (ECS Fargate)  
✅ HTTPS + eigen domein  
✅ Database + veilige configuratie  
✅ CI/CD pipeline  
✅ Logging & monitoring  

   Dit lijkt sterk op hoe bedrijven hun systemen bouwen



# Waarom ECS Fargate en niet EC2?

Ik heb bewust gekozen voor ECS Fargate omdat

   geen servers beheren nodig is ✅  
   automatisch schaalbaar is ✅  
   minder onderhoud vereist ✅  

   Hierdoor kan ik me focussen op de applicatie in plaats van infrastructuurbeheer



# Problemen die ik heb opgelost

Tijdens dit project heb ik meerdere realistische problemen opgelost:

   503 errors via load balancer  
   Container image pull fouten  
   DNS en SSL certificaat problemen  
   ECS tasks die niet starten  
   Database connectie issues  

   Dit heeft mij geleerd hoe echte productieproblemen werken


# Hoe kun je dit project draaien?

### 1. Clone de repository
```bash
git clone <your-repo-url>
cd your-project
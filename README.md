## Vars

export HAB_AUTH_TOKEN=(github token with GitHub authentication: user:email and read:org ) 
export HAB_ORIGIN=pollosp # your origin created in https://app.habitat.sh 

## Others 

- First time setup 
  - hab setup
- Enter into the studio
  - hab studio -k pollosp enter
- Build execute build from the studio 
- Upload packge to the depot
  - hab pkg upload results/originname-sinatra-0.0.1-20170221175520-x86_64-linux.hart (your hart artifact)
- Export to docker 
  - hab pkg export docker pollosp/sinatra (your origin)/(your package)

## Useful doc

- https://www.habitat.sh/docs/share-packages-overview/
- https://www.habitat.sh/docs/reference/plan-syntax/
- https://www.habitat.sh/docs/create-plans/
- https://www.habitat.sh/tutorials/getting-started/mac/create-plan/

# AsteroidHerder Assesment app-02

* Create two visually different web projects in a language/framework of your preference
* Dockerize and create helmcharts for both components
* Deploy your charts to a local kubernetes environment (i.e. Docker Desktop)
* Create a service to expose the applications

### How to build the docker image for enquiry-app
`./run.sh`


### How to Manually deploy the enquiry-app to k8s cluster
`kubectl apply -f enquiryapp-deployment.yml`


### How to deploy the enquiry app using Helm chart

```sh
cd helm-context
helm upgrade --install enquiry ./enquiry --values ./enquiry/values.yaml --namespace asteroid-herder --create-namespace
````

### Verifying the deployment on k8s

```sh
sriramyeluri@MacBook-Air helm-context % kubectl -n asteroid-herder get all
NAME                                         READY   STATUS    RESTARTS   AGE
pod/enquiryapp-deployment-55b8fb74f9-4tl26   1/1     Running   0          12m
pod/webapp-deployment-586c568ff4-wvq5s       1/1     Running   0          13m

NAME                      TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/enquiry-app-svc   NodePort   10.97.147.253   <none>        80:30004/TCP   12m
service/web-app-svc       NodePort   10.106.52.245   <none>        80:30003/TCP   13m

NAME                                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/enquiryapp-deployment   1/1     1            1           12m
deployment.apps/webapp-deployment       1/1     1            1           13m

NAME                                               DESIRED   CURRENT   READY   AGE
replicaset.apps/enquiryapp-deployment-55b8fb74f9   1         1         1       12m
replicaset.apps/webapp-deployment-586c568ff4       1         1         1       13m

```

### How to access the website
[enquiry-form](http://localhost:30004/)

### Autoscale
kubectl autoscale deployment enquiryapp-deployment --cpu-percent=80 --min=1 --max=10 -n asteroid-herder
kubectl get hpa -n asteroid-herder
kubectl delete hpa enquiryapp-deployment -n asteroid-herder




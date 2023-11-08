model=bigscience/bloom-560m
volume=/software/data/pytorch/bloom/bloom-weights/ # share a volume with the Docker container to avoid downloading weights every run

#docker run -td --name sarkar_tgi -p 8082:80 -v $volume:/data --runtime=habana -e HABANA_VISIBLE_DEVICES=all -e OMPI_MCA_btl_vader_single_copy_mechanism=none --cap-add=sys_nice --ipc=host tgi_gaudi_sarkar --model-id $model --revision ac2ae5fab2ce3f9f40dc79b5ca9f637430d24971 2>&1 | tee log.txt

docker run -td --name sarkar_tgi -p 8082:80 -v $volume:/data --runtime=habana -e HABANA_VISIBLE_DEVICES=all -e OMPI_MCA_btl_vader_single_copy_mechanism=none --cap-add=sys_nice -v /home/sasarkar/clean_model_garden/optimum-habana-3/optimum-habana/:/root/sarkar --ipc=host tgi_gaudi_sarkar  2>&1 | tee log.txt


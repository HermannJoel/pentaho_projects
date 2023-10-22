from datetime import timedelta, datetime
from airflow import DAG
from airflow.utils.dates import days_ago
from airflow_pentaho.operators.kettle import KitchenOperator, PanOperator
from airflow_pentaho.operators.carte import CarteJobOperator, CarteTransOperator 
from airflow.utils.dates import days_ago
next_run = datetime.combine(datetime.now() + timedelta(days = 1), datetime.min.time())

ktr_kjb_path = '/mnt/d/local-repo-github/pdi/pentaho_data_engineering/js_datamart/'
kettle_dir_path = 'mnt/d/pentaho/data-integration-9.4.0.0-343/'

DEFAULT_ARGS = {
'owner': 'nherm',
'depends_on_past': False,
'start_date': next_run,
'email': ['hermannjoel.ngayap@gmail.com'],
'retries': 1,
'retry_delay': timedelta(hours=1),
'email_on_failure': False,
'email_on_retry': False
}

with DAG(dag_id='run_jb_main_js_datamart_warehouse',
         default_args=DEFAULT_ARGS,
         dagrun_timeout=timedelta(hours=2),
         schedule_interval='0 19 * * 1-7') as dag:
    
    jb_load_dev_env = KitchenOperator(
        queue="pdi",
        task_id="load_dev_env",
        directory={f"{ktr_kjb_path}"+"framework/pdi-files/developper-tools/"},
        job="jb_set_dev_env.kjb",
        params={"P_JOB_NAME": "{{ jb_main_js_datamart_warehouse }}",
                "P_PROJECT_NAME": "{{ js_datamart }}",
                "P_WORK_UNIT_NAME": "{{ lk_region }}"},
        dag=dag) 
    
    jb_load_js_datamart = KitchenOperator( 
            queue="pdi_2",
            task_id="load_js_datamart",
            directory={f"{ktr_kjb_path}"+"js_datamart/pdi-files/warehouse/"},
            job="jb_main_js_datamart_warehouse.kjb",
            params={},
            dag=dag)
    
    jb_load_dev_env >> jb_load_js_datamart

if __name__ == "__main__":
    dag.cli()
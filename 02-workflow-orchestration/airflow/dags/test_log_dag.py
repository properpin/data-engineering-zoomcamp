from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta

def print_hello():
    print("Hello from test DAG")

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'retries': 0,
    'retry_delay': timedelta(minutes=1),
}

with DAG(
    'test_log_dag',
    default_args=default_args,
    description='A simple test DAG for logging',
    schedule=timedelta(days=1),
    start_date=datetime(2025, 7, 1),
    catchup=False,
    tags=['test'],
) as dag:

    task_print_hello = PythonOperator(
        task_id='print_hello',
        python_callable=print_hello,
    )

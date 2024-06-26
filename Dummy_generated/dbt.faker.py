import faker
import pandas
from snowflake.snowpark import Row


def create_rows(dbt, session, source_name, table_name, num=1, **kwargs):
    fake = faker.Faker()

    df = session.create_dataframe([
        Row(**{
            key: getattr(fake, value[0])(**value[1])
            for key, value in kwargs.items()
        }) for x in range(num)
    ])

    df.write.mode("overwrite").save_as_table(
        f"{dbt.this.database}.{dbt.this.schema}.fake__{source_name}__{table_name}",
        create_temp_table=False,
    )

def model(dbt, session):
    dbt.config(
    materialized="table",
    packages=["faker", "pandas"],
    )


    create_rows(
    dbt,
    session,
    num=250,
    source_name='fake_tpch',
    table_name='orders',
    O_ORDERKEY=['pyint',{}],
    O_ORDER_DATE=['date',{}],
    O_CUSTOMER_NAME=['word',{'ext_word_list': ['customer A', 'customer B', 'customer C']}]
    )



    df = session.create_dataframe(['yes']).to_df("are_we_faking")
    return df
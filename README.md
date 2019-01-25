# `nomad-spark`

Spark Dockerfile setup with native support for Nomad as a scheduler.

The current version(s) of Spark is/are built:

- 2.4.0
- 2.3.2
- 2.2.2

The current version(s) of Nomad is/are built:

- 0.8.6

The current version(s) of Hadoop is/are built:

- 2.7

The current version(s) of Java is/are built:

- 8

Note that both Spark and Nomad should be fairly compliant (though at your own
risk) across patch versions, i.e. Spark 2.3.2 can be used to replace Spark
2.3.1, so generally one only needs to look at the `{Major}.{Minor}` built
versions for the right selection.

Hadoop generally follows the above logic.

Java, on the other hand, should be fairly compliant across its major versions.

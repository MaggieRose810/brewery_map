require "kafka"

$kafka = Kafka.new(
  # At least one of these nodes must be available:
  seed_brokers: [ENV["KAFKA_BROKERS"]],

  # Set an optional client id in order to identify the client to Kafka:
  client_id: "brewery_map",
)
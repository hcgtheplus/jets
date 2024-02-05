# CloudFormation Docs AWS::ApiGateway::Stage: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-stage.html
#
# Example:
#
#   ClientCertificate:
#     Type: "AWS::ApiGateway::Stage"
#     Properties:
#       ClientCertificateId: ~
#       RestApiId: ~
#
module Jets::Resource::ApiGateway
  class Stage < Jets::Resource::Base
    def definition
      {
        Stage: {
          Type: "AWS::ApiGateway::Stage",
          Properties: {
            ClientCertificateId: Jets.config.stage.client_certificate,
            RestApiId: "!Ref RestApi",
            DeploymentId: "!Ref #{deployment_id}",
            StageName: Jets.config.short_env
          }
        }
      }
    end

    def deployment_id
      Jets::Resource::ApiGateway::Deployment.logical_id
    end

    def outputs
      {
        Stage: "!Ref Stage",
      }
    end
  end
end

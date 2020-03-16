package si.fri.prpo.api.v1.resources;

import org.glassfish.jersey.process.internal.RequestScoped;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("test")
@RequestScoped
public class Resources {

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public Response getTest() {
        String message = "Test: OK";
        return Response.ok().entity(message).build();
    }

}

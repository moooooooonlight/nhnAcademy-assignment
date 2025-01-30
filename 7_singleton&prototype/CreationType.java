import java.lang.annotation.*;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface CreationType {
    ObjectType getObjectType() default ObjectType.Prototype;
}

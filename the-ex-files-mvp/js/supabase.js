import { createClient } from "https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm";
const url=window.SUPABASE_URL||"", key=window.SUPABASE_ANON_KEY||"";
export const supabaseConfigured=Boolean(url&&key);
export const supabase=supabaseConfigured?createClient(url,key,{auth:{persistSession:true,autoRefreshToken:true,detectSessionInUrl:true}}):null;

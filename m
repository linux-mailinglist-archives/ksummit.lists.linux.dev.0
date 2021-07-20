Return-Path: <ksummit+bounces-416-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B43CF13E
	for <lists@lfdr.de>; Tue, 20 Jul 2021 03:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 16E1D3E10FB
	for <lists@lfdr.de>; Tue, 20 Jul 2021 01:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721DB2FB6;
	Tue, 20 Jul 2021 01:21:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4041D173
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 01:21:58 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id b6so17751098iln.12
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 18:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1hCKZdMlYWGHr0AakILyPTf/0fbxITM6/9XswOfi5+s=;
        b=q5xuSMuE57JgCQ+7gUVwCog1vBpCYv8MEzUPHUc5bEMCi8964+rkd70r1miWUpcHQe
         cGg8ihGvrLK4zWlVwOoMSyyRuBlpnO7MVS6k0oWgVLpcdflyRLeiGFQNt7Z+2foRZ+RL
         zgASWfajlcz6KaBxlyAWEvE54iUtek03lEVGkC0v4LZ7hj/yJzrATYU/kGZJstlfI3EW
         FCdnxWRwt7blStkTLYAT6nzrN4WyDtA3ULV1EogH0XSQ2UMUesiYXr9I//pOGq2FgUNa
         iirrrq1qQy+NzyOJrSmNtevhV3B0kwUpvfJUmHo2U0qP8IpljohqML4OLA3kXQymzfEm
         NPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1hCKZdMlYWGHr0AakILyPTf/0fbxITM6/9XswOfi5+s=;
        b=tgLIGjAMr2/tF1JVEmIGEoM92aLtueR5uJ2nZBBbvm3jgf/wmrXVrrpmyGXqXBoeVO
         RsHi2edpc92snbyWifDT34r76DRNvUYRNIY5firz8Dlc4yZVUyY1D21JWiZIbnfTUAz8
         Wd4a0o0OAKVtEfNo5P4gGYkBL2nSuoJQnpcS2MglbJHrCf2FQHg6z/c2N1ZXhjMDsOoT
         mcoZMCr3TG9Xa16Gbza3RDa0OmzmoJDHxylbajiqnYh+XQWRRjyvtbS2uh1GlF4VpVO4
         OHtXsh3h9fFlFe0FhPNglhyRfzPkjD11q0negEqpoLTTcDJPYpzs3TLgRGtMy4un2N6z
         7E0A==
X-Gm-Message-State: AOAM533NIwJBGRQF+rcxuX9NzfPpGNp26lhx7H/WbwTvihuXGpu7sKTu
	/iLTOV0JHvuIUpR5za++T5Lm5yygVOZr1tPJFag=
X-Google-Smtp-Source: ABdhPJxr8eB5CpCaXDM6A4ISZbPInNggWwcK9yjOc3skxHMaH1+vpxzq23OrqWZYYDFLWzc6GrmBL5/tr7O10txvKqg=
X-Received: by 2002:a05:6e02:de6:: with SMTP id m6mr19037756ilj.203.1626744117419;
 Mon, 19 Jul 2021 18:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com> <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
 <YPWPbbqdG3aFCmAZ@google.com> <CACRpkdYqfYrhWT2kZ0uy8hS__EfVmQdq8X5ev6Oke+WQWfiDSg@mail.gmail.com>
In-Reply-To: <CACRpkdYqfYrhWT2kZ0uy8hS__EfVmQdq8X5ev6Oke+WQWfiDSg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jul 2021 03:21:45 +0200
Message-ID: <CANiq72kHY=w8VVHUH8EyLcfRXQzq+OXOBCrrW7dHk9kkzJ_BHQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Jan Kara <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 12:16 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> I think it's not a good idea to keep these wrappers in their own
> rust directory, they need to be distributed out into the kernel
> everywhere they are used. We have made this mistake before
> with OF (device tree) that started exactly like this in
> drivers/of/*, and now I have part of the OF GPIO handling
> and tests inside files in that directory as a consequence.

The `rust/kernel/*` folder currently contains all the "Rust
abstractions" that are shared by all the kernel, i.e. in the rest of
the kernel tree we have kernel modules that are users of the
abstractions.

The main reasons behind this approach are that it is the simplest one
and that it makes a clear distinction between abstractions and user
code. In fact, code inside `rust/` has some capabilities that we do
not allow for non-`rust/` code. For instance, `rust/*` code can use
the C bindings and has unrestricted access to Rust unstable features
(though we still carefully pick the ones we use, of course). This is
not the case for "normal" Rust kernel modules elsewhere.

Having said that, this is not set in stone or a hard requirement -- we
can definitely split things and move them elsewhere, e.g. having a
`gpio` crate in `drivers/gpio/`, for instance. We could still follow
special rules for "subsystem objects".

In any case, please note that the compilation model is different in
Rust than in C. In Rust, the translation unit is not each `.rs` file,
but the "crate" (i.e. a set of `.rs` files that are found by the
compiler given a `.rs` entry point file), there are no header files,
etc. Thus some differences apply. For instance, currently having
everything in the same "crate" means the compiler can see everything
even without LTO.

> The wrappers are a hard read, I notice a whole lot of unsafe

The Rust abstractions are indeed harder to read, specially now that
they aren't documented -- Wedson did a great job to have all the
pieces ready quickly to show a working GPIO driver; but later on the
files will be documented, with `SAFETY`/`INVARIANT` comments too (that
we require), etc. as you can see in other files.

In addition, a lot of complexity comes due to using the C APIs. As we
discussed in the driver model discussion the other week, if we all
decide to give the Rust side more freedom to reimplement things,
including entire subsystems without being constrained by the C API,
then we can definitely reduce the complexity (plus reduce the number
of `unsafe` blocks etc.).

Finally, as we get to write more abstractions/subsystems/wrappers, we
will all learn the code patterns that tend to appear, how to factorize
them, how to clean things up, etc.

> keywords here, Chip is missing .set_config() which is understandable
> since PL061 isn't using it, the New call to create an instance
> contains a lot of magic stuff I don't understand like
> state: AtomicU8::new(0) and such but I think that's all right
> it probably only needs a trained eye.

Yeah, that `{ state: ..., ... }` syntax is just initializing a
`struct`, similar to the `{ .state = ..., ... }` designated
initializers in C.

Thus if you have some `struct MyFoo` and you are writing a function
that initializes it, then you can think of that `new()` as something
like:

    struct MyFoo myfoo_new() {
      return (struct MyFoo) { .a = 42, .b = 43 };
    }

vs.

    impl myfoo {
        pub fn new() -> Self {
            Self { a: 42, b: 43 }
        }
    }

Similarly, `AtomicU8::new(0)` is just a call to a normal function --
you can think of it as `atomicu8_new(0)`, i.e. it is just namespaced
inside a type, but it is a normal / free / plain function (i.e. not a
member function / method).

> (...)
>
> To that end the core of the GPIO library would probably
> have to be rewritten in Rust and used on *all* platforms
> in order to buy us any improved security. I understand that

I do not agree: a bug in a driver can cause havok of all kinds in a
system, security-wise or otherwise. One does not need to rewrite the
entire kernel in Rust to start to see benefits.

Moreover, even if Rust did not buy us any security, writing Rust code
would still have all the other advantages as listed in the RFC.

> this is not currently the plan.

Let me clarify that it is not against the plan either.

In other words, we are following the approach of wrapping C APIs
because we think it is important to show that Rust can actually
cooperate with the C side, plus that one can actually write safe
abstractions for existing C code without leaking a lot of `unsafe`
into drivers.

But things can definitely be written from scratch too -- and that
gives extra advantages, definitely (and not just in security).

Cheers,
Miguel


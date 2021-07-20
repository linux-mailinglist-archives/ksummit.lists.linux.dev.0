Return-Path: <ksummit+bounces-417-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0963CF193
	for <lists@lfdr.de>; Tue, 20 Jul 2021 03:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 79D643E104A
	for <lists@lfdr.de>; Tue, 20 Jul 2021 01:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D2F2FB6;
	Tue, 20 Jul 2021 01:46:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1526173
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 01:46:24 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id a11so17827543ilf.2
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 18:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aShbJsP41HxAyEddhHJguTwWDxZVrQjiAg7FxnWOq6c=;
        b=nNCx8a4KoLD560k39NojPxGeOsqQkaCwu+0CDyf75DC5zrRtuYhRfD40E0VLDXLL7D
         OiH1GrHtgUsGTg/LdJ4gDtCg6o3kHF35wsNwCHD0a0Hrc59SaHYCRRKHrBJsZqXQ1Mrn
         z9MyP0JBkwSWk+sU3UQIkZn0aHOZ7lO39MXDDZDhneGq7lz+9ICE5vBmg439HdUbWljk
         jmNhnuQfUbPy6ZOz5fR4F/n+fiYY5p1kAmlXzzcrmuiqgf7SiilEWOczjlCfkNx6dcvf
         gII/YsOFv8GhhPIGzNQ9IMcDAkTvlK8tSHUNCKA6FlemwLsGOxr2dcO6vRdedQnMX8Tm
         pG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aShbJsP41HxAyEddhHJguTwWDxZVrQjiAg7FxnWOq6c=;
        b=tEqY9uX2PXAEtUGXTKX79mpR/mzRArS8WvJ6OTe1xYfZ67cEJW4LhzKEdCPjPchOOZ
         IlZpWvB0dNGp4PF1UdEAH8ZF5589szp49kB7RTgujeF+HbZzFkcCKlNrML9AxhP0A0x9
         RcTjIpoETHAB+HRCoI9GTVi2PFLa+ou7yyIswwxANxixgbJcniU2R00oAwwnEuLdF10g
         EkfjlXHEvMP6Ps92AFCSXDh7jndK/Yqn9TcMPD7WOMQhpq8Ikgswh8XC2Vy4+GEa0nLS
         EOTmLNwXqgzqAhZUCGZFDvjI7nsdgbDr7oyjLvJ9zvsGMCSeALLLjEwKKxrvz7uMQtz1
         vi0A==
X-Gm-Message-State: AOAM533xjB3qahbMAWrKGkR2bNqvhifEFIVedkK1hw8cKmxdEp81NFuj
	V7B6EX5qCOwGW4WJQ/sYa7ZWy0zHkdSPP7+iUtA=
X-Google-Smtp-Source: ABdhPJxWwdcXuRomqjj48aoo2o5qbZCNaTSf8pEgHLuI8v81aXL4TVczZENgHwv1dkmSxXxsE9DMW3KL4CTbKsMZT8g=
X-Received: by 2002:a05:6e02:dc4:: with SMTP id l4mr19823208ilj.94.1626745584118;
 Mon, 19 Jul 2021 18:46:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOX+N1D7AqmrY+Oa@google.com> <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com> <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com> <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com>
 <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
 <CACRpkda8cD+BOjgE996PGDG8Tb9_7wV8j3AkTkYPLMmW9OS+iw@mail.gmail.com> <CAK8P3a0EjQesQi1mUq5D5ATYMW+sy6gAxNbsE8Sq9vU4j5UrCw@mail.gmail.com>
In-Reply-To: <CAK8P3a0EjQesQi1mUq5D5ATYMW+sy6gAxNbsE8Sq9vU4j5UrCw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jul 2021 03:46:12 +0200
Message-ID: <CANiq72mQ4+Z0Q4uBs0m7R5eFBAohQNzTcJMAXPqh=sOCVJa+=g@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Wedson Almeida Filho <wedsonaf@google.com>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 11:33 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> I'm worried that this makes things harder to grep for, and to document,
> when the same structure is used in both Rust and C.

For the former, by grepping you should find the Rust abstractions that
use the C structures, because binding generation does not change the
names or their case. Of course, the Rust abstractions on top of that
is a different matter, but those do not exist in C anyway. So, at
least for the use case of searching Rust abstractions that use a given
C structure or API, it should be fine.

For the latter, we started linking the C code and/or docs from the
Rust ones. We do it manually now, but ideally we should be able to
reference C docs (and/or code) just by writing the C name, something
like:

    /// Similar to a C [`spinlock_t`].

This is a feature that already works for Rust definitions and we use
it all the time, but not for C ones (obviously). My current plan is to
have `rustdoc` support a "external references map" that is added to
the internal map of Rust "intra-doc" links that it already has. With
that, we could have Sphinx generate the map of references pointing to
its own docs.

Cheers,
Miguel


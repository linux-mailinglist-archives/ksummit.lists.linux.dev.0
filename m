Return-Path: <ksummit+bounces-397-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E63CD736
	for <lists@lfdr.de>; Mon, 19 Jul 2021 16:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B32301C0E71
	for <lists@lfdr.de>; Mon, 19 Jul 2021 14:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDE52FB3;
	Mon, 19 Jul 2021 14:54:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C540470
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 14:54:13 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id y6so16185268ilj.13
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9OsYrKLJFnV2mVP1e0HgyoCPiXrLTaQGzJATlz80mhI=;
        b=b7cA9IBX+aDgRWW6Z3dlpBa5iPgKfOdr7lOpG/3UbqZ0c4PY6e3XVPCLN/Q0cDPGyb
         EBiaBeeEm9LMUZuP6LrfTgxMqdI0T0z6a6DsGh5tvwO1+3xolH1k9g4B2Umpm2ceZORl
         wYuqZAQ+5MQUifpxUHQ3fUrIletuAW54coA49o+xCt46OWsW3dR59ndWR2WzmUpHv4EE
         45aGgBvroprg2x3nNWTdomo7uDVk62MLG4AQrtc8zyl4qwxNvR1FhfkDyhqX1XwAVXb0
         zmEjJTXSsIuCvSZeeIhW/xi5U6Y0KHsv0SMRtIFaWUwvsfx+wM47EEXMZa1RjQuwZwsA
         7Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9OsYrKLJFnV2mVP1e0HgyoCPiXrLTaQGzJATlz80mhI=;
        b=ptulE50dKsUlUG2Bx9L+ia7qvI6/TSRVsxcBBfJP43ftCFv+HRhjYDD8WrGMUU3Yjq
         Co0CvXBsv6sNLxRPlCj9m8M6taZvMc4V8RULF6GWn5Kkupb0N3VgKC6XVySahNXOT+it
         gUxVOgTWrOVQL+s2s1CAqtfU7wIUmpKlbHuDy4VquLYgQ8SaQPeWabonPrTLl5w01viv
         WYo4D55v+Kwsh3DM6eZuHJopAKbJgiNwSfbocMzqytcnYg7sICBKg1VWTanwKcmtjCf4
         fAbr98+53qxnRlnYGumX5OC28c/D9iYYcW1aJ5WJjCHL86uaI6SCvz5IkCqgIMgSLMWl
         20dA==
X-Gm-Message-State: AOAM531lZIOV/NtnIcspO+9QcjbpgZjamtlHR2mgIacksgmtl/RdftlG
	GEOAHzLbd/CNA4Ci2L41LQEw6mvyVwEi0iObhzc=
X-Google-Smtp-Source: ABdhPJyA1myl2I114kuAreF20XNcfx3zPohHH84LJyufMZiPYv3OILzx6KW2snT6/0N2/b0O2xZWYChnBNUInYqE0qQ=
X-Received: by 2002:a05:6e02:dc4:: with SMTP id l4mr18086663ilj.94.1626706452944;
 Mon, 19 Jul 2021 07:54:12 -0700 (PDT)
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
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com> <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jul 2021 16:54:01 +0200
Message-ID: <CANiq72knmcA_9ZTk13ECSC1jUeVQx9di9hqHjFF6M+-HRRDWoA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 4:02 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> - All the dev_dbg() seem to be replaced with pr_debug!(). Does that mean
>   we lose the information about the device instance in the output, or is
>   that magically added back?

We do not have the `dev_*`-style printing facilities yet, but we will.

> - What's with all the CamelCase? Is that enforced by the language, or
>   can we use the same identifiers here that we have in the C version?

It is not a hard error, but we recommend following the standard Rust
style (and we enforce it, currently). As Linus said, it is a way to
easily differentiate what is what, instead of using a prefix or
suffix:
  - Types (and similar) are in `CamelCase`.
  - Functions (and similar) are in `snake_case`.
  - Statics/consts are in `SCREAMING_CASE`.

See https://rust-lang.github.io/api-guidelines/naming.html

Cheers,
Miguel


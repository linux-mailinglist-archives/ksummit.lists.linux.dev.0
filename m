Return-Path: <ksummit+bounces-264-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 860043BDE21
	for <lists@lfdr.de>; Tue,  6 Jul 2021 21:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 8EDB11C0EFE
	for <lists@lfdr.de>; Tue,  6 Jul 2021 19:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96882F80;
	Tue,  6 Jul 2021 19:43:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90A470
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 19:43:26 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id g3so21941519ilj.7
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 12:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L3wT2SrKuVl6jI6p6O5HgarARoLWg8qIpDVhx5gw5Bs=;
        b=s+i4L7t1jioOfNId5wRa4MqQTo5laUy2zmPdJ/IDujtcAtzy2jfclleauXI+p7pT1v
         7/JuOMoezDNZxAlgQeskJJrSil1J6EWfi/Vv65InlHXchi6MqcqOWU87PDsE+aG/oxje
         Z03x3i0V7vYEwVW3Dm2wv535zuQGW3P7vufLxF0qWx3MVuIP8kEm3ruKxA+MPlfYrgHU
         rWUzyh0BEcQQgtXI+yXbaCeXx4J3lXmlsYu/cLnLd8pAc58y0aSC9XFDa46h6fzNmEMX
         S/BCkQI8KSXTpMqttTjfysCMh/0N+m8DSV2/KhBsPRqZpbzetfLsJ4hAb8qZGOIRoSD4
         Khwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L3wT2SrKuVl6jI6p6O5HgarARoLWg8qIpDVhx5gw5Bs=;
        b=PdrKzSWhj1evvE+TJfbKSfx4ScawALn5WU+T4WMArFKAKgYjCPUsSS7WFfywW+/SZt
         mFhF5cXnrhzfYsRr1mbEEfTJkePahWdizro+JSqW32gF4RMIj0EmliQ8GYe8FOOnPeI7
         h1ah4V0/rK53gyOWav9pHxbBgw2tikSaTjOvXqbTVkoFBprF42Zy+EaF5UR+9fTr/ytc
         lmeHlhP63H0UoPtaRDwC1yxhzTC0lKkVzyB1bT9FOq32I0WeFe7cQ6V2MFX92GoxHSCW
         gfGM1U5VY1b0A6wQa4X2dPV1bmVYfI2wHifBECZxv+18GID3woDfE8wNkhZot42M1Mah
         B3Fw==
X-Gm-Message-State: AOAM532BogXx2huNRvc5asGqtRHzTMDhAxIqUwwvQE8M35queYfTpIc5
	7L7BqponkKeIx37a8wgGGFIbnNmH1x2nwB9nrAE=
X-Google-Smtp-Source: ABdhPJxGWsg68RDWOfYKGNfbEQhWcKCp+udDqtV+xq5/9WgnM01KjyUfh7shA9QbYtmAjSGcjhBnbUITwYMClveXiOk=
X-Received: by 2002:a05:6e02:ea2:: with SMTP id u2mr15160372ilj.247.1625600606139;
 Tue, 06 Jul 2021 12:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com> <db6ee5da45bbf526b13fda7d1cd2bf93f24cd84f.camel@sipsolutions.net>
In-Reply-To: <db6ee5da45bbf526b13fda7d1cd2bf93f24cd84f.camel@sipsolutions.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 21:43:15 +0200
Message-ID: <CANiq72=HAMqn6aqVpieyLyP4gOMT4zKzYRNTZ0TqNYEC4hdjKw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 9:13 PM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> I couldn't really find a good place too hang this question, so it's here
> now ;-)
>
> Mostly from what I've seen you've been talking about rust being the
> 'leaves' in the graph, in the sense that it consumes C APIs exposed by
> the kernel elsewhere, etc. In drivers using things, for example.

Almost! Ideally, Rust modules should consume Rust APIs, not C APIs.
Please see the other responses on the "leaf" modules I just sent and
what the "Rust abstractions" are all about.

> How about the other way around? What if we'd want to slowly replace
> (parts of) a subsystem with rust code, but leave drivers? Or let's say
> write some data structures in rust because of the stated benefits, but
> let C consumers exist?

This is definitely possible too, and I would love if that happens.
However, note two points:

  - It would only net you advantages inside your implementation and
for Rust modules (both are of course important), but not on the C
drivers, of course, because you cannot expose Rust features back to C
(such as the ability to describe what is safe and what is not, types
that guarantee certain invariants, etc.).

  - Currently there is no GCC codegen path for the Rust side -- so
your subsystem would not work in all architectures until
`rustc_codegen_gcc` or GCC Rust are mature enough. The former may be
ready sooner than we expect. The latter will take longer -- I was told
about 2 years for kernel compilation purposes.

Cheers,
Miguel


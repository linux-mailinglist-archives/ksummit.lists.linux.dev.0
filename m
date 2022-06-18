Return-Path: <ksummit+bounces-651-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 451C355041A
	for <lists@lfdr.de>; Sat, 18 Jun 2022 13:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688D1280A99
	for <lists@lfdr.de>; Sat, 18 Jun 2022 11:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412F82598;
	Sat, 18 Jun 2022 11:03:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0541B7B
	for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 11:03:49 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id m16so3006478ilf.6
        for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 04:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bnV6m52q4UuX2kc1EQX1eWsQB51U83Dp8HBu3UH/gNE=;
        b=JZIZGR3ylA4bu6qSbyqnDeaP1GMhWs6mPBhyHSL/q45Rm6qTwy7ePSawk2eJ8ZdIEr
         rnyzLOOsQy17Q7KWscsntMWV/gzk4840CbHpaVnPxxzHeuO53N89n+HqF3xeClXktvJi
         +NZ86hnreHZmUeH76suMZ0CC3YpIlem6LioKrCnINdiD2rKrazwS8Nt+fUQZyJdntg+i
         Z0Pv/RgtY/Uty0900o1hvnErfBP6o1OaKGU7nZ0bGAhaX+6HMXa/kW6sJp5SnhKYQ3fo
         8hRskasLxsBJYumvbQQUzaSeAcViIjrX/keVY6MWBg2ZjD8weJAzaK/b5Tpuopu2Pw/f
         IUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bnV6m52q4UuX2kc1EQX1eWsQB51U83Dp8HBu3UH/gNE=;
        b=GAhNkhayv2YwAjbwQiJFlGlYzoGhdEYzyUUOtn2zI2Im5X2asG96RcpPiRtszDvK5N
         pJMkaHRnOWuoBv+h2YyOfZQ6iTGld7JvevBjH3V31TcZvjcacKwbdChxvvj9FwbEAPOR
         AmzRYlTGDZLriAmno33CBnk/5nXxwzl2pwemFWmvduXiv+8ayQuZ0hvIAwP9nqu6unTy
         WeUEg6ZTduTuPclxGhse9xpX5jD4oLK2+Y9sQfYRjfeYU8m2B5+i3Rk3bIAt/RKzR63z
         qfZSQ2M+jIJ+M7XXPQJ/I0veo51biHm5eVCG3JLSLAc+gXsbrn/rx8BRNUXd7VTOP1dr
         ISjQ==
X-Gm-Message-State: AJIora/917P7kRdKqhH7gI7HCXm2HvI2b06B5wy+NrMbyFxzG7MKWSUx
	BBEJp7xLjoa7yqE36D59i+2y/BiuNN9ernP/8DM=
X-Google-Smtp-Source: AGRyM1v9uMAP/jrUPcRjGGGNPWlA1hRqgbcqx/FJJUd+O0Xiuc1dI8iZn/pFCyrKDO1NsarAOftMBdjs9pVtopsuFo4=
X-Received: by 2002:a05:6e02:188f:b0:2d3:c38f:7e9b with SMTP id
 o15-20020a056e02188f00b002d3c38f7e9bmr8010003ilu.151.1655550229114; Sat, 18
 Jun 2022 04:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
In-Reply-To: <20220618092447.5ebed314@sal.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Jun 2022 13:03:38 +0200
Message-ID: <CANiq72kafybxPbS13g+heYMX=Ggmw_8MqYj41uJ0Ek=3HP7-eA@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit <ksummit-discuss@lists.linuxfoundation.org>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 18, 2022 at 10:24 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Life would be a lot easier on this side if rustdoc could
> support ReST.

Not sure what you mean by this. Do you mean writing ReST for Rust
documentation? For the files inside `Documentation/rust/`, we already
use ReST [*] like the rest. For the source code docs (the ones handled
by rustdoc), it outputs HTML. Or do you mean using rustdoc to generate
`Doc/`s or similar?

[*] Though it would be nice to be able to use Markdown (but that is a
different topic).

Cheers,
Miguel


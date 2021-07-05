Return-Path: <ksummit+bounces-234-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F35C3BC43D
	for <lists@lfdr.de>; Tue,  6 Jul 2021 01:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 95E851C0DFD
	for <lists@lfdr.de>; Mon,  5 Jul 2021 23:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962DD2F80;
	Mon,  5 Jul 2021 23:51:25 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6335D72
	for <ksummit@lists.linux.dev>; Mon,  5 Jul 2021 23:51:24 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id k8so26607606lja.4
        for <ksummit@lists.linux.dev>; Mon, 05 Jul 2021 16:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BUw8Dh/lml6sLyXBVI/h1/fSRpqnpXukCnxmtAVtsCE=;
        b=ZFWThXUpE8iCuxpCY+Cdr/hr7KzUVuTVwfQV4PUYlaP3UABHPJJLIwLQvptk/JvU3O
         CLH9vZgVC7GTH1h06XI2/wDJzoucq4SAmtvy8YKfGHNwksO2zght072n9UEL3WHq//td
         txoVobhonx0Z7BQliaPKCw/mhcxAMSrMIwXRVES8oQlcIhUb+7jMDJkDVTA+lXug2gMU
         8HYfnOswJvZPjue6mdE+wXO7pkgq9GSfvq+S9wareSuDcDSvOer4mltQXjSXwCwHqWpS
         OjzxoaYDOdKhd41NPUbaG3RdnYzK7bxfIdNcUJu/KfhfvXgC+GKSe5D8/iU2iqNHHcDb
         vW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BUw8Dh/lml6sLyXBVI/h1/fSRpqnpXukCnxmtAVtsCE=;
        b=o6U0+1dupjvNVNNNIZoHaRQFmgaz7N8ZwCzwvWBFl5HVxCBvmqG3Axk/Jde0tfGbBx
         ailAjDM6XrCeUJsO40fJe9XVW30nM1BAXf8tUfrXlfIZbp1liTVCZ8LdSiIpzHdW5yWs
         ldirxj2327at43TB5MxXWkQxAqd4pZ+TshlZVizPVgjT8ZTDrM/2SeTzd7nOlgMhIqbt
         JqYfC971RLiGMEmjEwjRRAD9F3H1JOivfvVhTe1Rlw7zmBsLHg+6p0MIuo6A43+ZL/IG
         b/hZDP92t4ovC/MNjyPForhgWCO8gUbg7xuUeBPYAW2VkaoXR+EPvbmfvnOwbqZAzknU
         /m9g==
X-Gm-Message-State: AOAM5309HoI8WHsN+fKOlWxFlsVYN2tKcSJfOll5bjHZl8EYj9aIeCnM
	DFEQ9drEPqE2XSFAlR/ccGweDlhGcttdAVUJq5Hr1Q==
X-Google-Smtp-Source: ABdhPJx9djh5UK94YTs7qIZSavO2XdRcrvfXbsB4LAmgsBoYZiKUtnMkkshqkI8XQt3MgM0613Kp90uRRXwlkrIE9/c=
X-Received: by 2002:a2e:9210:: with SMTP id k16mr11837465ljg.438.1625529082404;
 Mon, 05 Jul 2021 16:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
In-Reply-To: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Jul 2021 01:51:11 +0200
Message-ID: <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 26, 2021 at 12:09 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:

> The Rust for Linux project is adding support for the Rust language to
> the Linux kernel. This talk describes the work done so far and also
> serves as an introduction for other kernel developers interested in
> using Rust in the kernel.

I think this is a good tech topic.

I think one thing that need discussing around this is implementation
language fragmentation and brainshare: kernel developers are all
assumed to grasp C, assembly, Make, KConfig, bash and some
YAML, perl and python here and there. I bet there is some sed
and awk in there and possibly more.

So, admitting how lazily we sometimes learn languages, which is
by copying, pasting and tweaking, then when that doesn't work
actually looking at the language spec (or StackOverflow) how hard
is that going to be with Rust? We get the hang of it quickly, yes?

I also repeat my challenge from the mailing list, which is that
while I understand that leaf drivers is a convenient place to start
doing Rust code, the question is if that is where Rust as a language
will pay off. My suggestion is to investigate git logs for the kind of
problems that Rust solves best and then introduce Rust where
those problems are. I believe that this would make be the
Perfect(TM) selling point for the language in the strict
hypothetico-deductive sense:

Hypothesis: Rust solves kernel problems A,B,C.

Collect occurrence data about problems A,B,C from git logs.

Identify code sites often exposing problems A,B,C.

Rewrite those in Rust.

Demonstrate how the Rust code now elegantly avoid
ever seeing problems A,B,C again.

From this it is very easy for the kernel community to deduce that
introducing Rust as an implementation language is worth it.

Yours,
Linus Walleij


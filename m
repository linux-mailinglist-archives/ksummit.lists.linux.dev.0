Return-Path: <ksummit+bounces-267-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2343B3BDE41
	for <lists@lfdr.de>; Tue,  6 Jul 2021 22:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 8D42A3E10C4
	for <lists@lfdr.de>; Tue,  6 Jul 2021 20:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C53F2F80;
	Tue,  6 Jul 2021 20:00:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3650A70
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 20:00:46 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id l5so132700iok.7
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 13:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H37Gp7Db45xNYTHACQNL5bXGkl2K/Htk6D2aSw1Min0=;
        b=CTBR2aQuglT0hlVthJwwzZdeXig+1IiwuusR85H4ngJ3p1aDjd/qQelbBb/bxEK4on
         x5eXreKG7jfGFUrX1sh/8aQ+00mgeBK0W378xHMha+mB25GrPwArYv9v+d8uDeAb0gUg
         ffAishOL61GC5MfOLQlOybs0akNzl8lQRR8sX6QTVC4vlp1Mci97dPB+GOS2FGQm2Dkd
         OtZpqXDwzpjpLbLVaYfEXtznQN4DjFPU+aLRw8Yl9bAfs0SJa0/0ttMzX2YiTqSbP0Bd
         WltG2xsQtJOWkng1SS4FJvl6lu41Ig1bWwhimTXKFBxuz7+2gdEMED9uXzNc2e/eHarJ
         XT9Q==
X-Gm-Message-State: AOAM532Cj8FRCKUVyl0cJQRFzbI7stXb+Erg2XYjgzWJWxDcvljYrRF6
	Hyio2QQxLSfiYdrJ+sIzJhwhWGo4181q9dzl490=
X-Google-Smtp-Source: ABdhPJwVbrxK9LlwV5Akn9o8AHBoTLmnOTW7LH/DekvsJ1edNEJpT0cPKBTSmS5mMmuJO7Vlq6IrHygsV8n7XvJLTlw=
X-Received: by 2002:a6b:b5c7:: with SMTP id e190mr17237073iof.31.1625601645263;
 Tue, 06 Jul 2021 13:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
In-Reply-To: <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
From: Roland Dreier <roland@kernel.org>
Date: Tue, 6 Jul 2021 13:00:28 -0700
Message-ID: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 5, 2021 at 4:51 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> I also repeat my challenge from the mailing list, which is that
> while I understand that leaf drivers is a convenient place to start
> doing Rust code, the question is if that is where Rust as a language
> will pay off. My suggestion is to investigate git logs for the kind of
> problems that Rust solves best and then introduce Rust where
> those problems are. I believe that this would make be the
> Perfect(TM) selling point for the language in the strict
> hypothetico-deductive sense:

One area I see where Rust could make a big improvement for drivers is
in using RAII for error paths.  Drivers often have a lot of code like

    if (something())
        return err;

    if (something_else())
        goto undo_something;

    if (a_third_thing())
        goto undo_two_things;

and so on, which is difficult to get right in the first place and even
harder to keep correct in the face of changes.

That leads to a lot of bugs in error paths, which maybe affect no one
until they become exploitable security bugs, and also means that
maintainers get a lot of patches like
https://lore.kernel.org/linux-rdma/20200523030457.16160-1-wu000273@umn.edu/
that need careful review.

"devres" / devm_xxx was an attempt to deal with this in C, but it only
solves some cases of this and has not received a lot of adoption (we
can argue about the reasons).  Better language-level support for
ownership / lifetime tied to scope would probably lead to driver code
that is better in several dimensions.  Even in C++, the RAII idiom is
quite nice and I often miss it in kernel code.

 - R.


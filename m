Return-Path: <ksummit+bounces-746-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B5158E8F9
	for <lists@lfdr.de>; Wed, 10 Aug 2022 10:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B410280A8A
	for <lists@lfdr.de>; Wed, 10 Aug 2022 08:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBDC17D3;
	Wed, 10 Aug 2022 08:42:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A28F15BC
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 08:42:40 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 123so22191666ybv.7
        for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 01:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SGLC/EiGSAvDsOlF3bsOZbU0/go6zOsdONN1AxUVZXI=;
        b=KMda9gpCszlSY+8m4kVrB33+H7S6VCZwG5tpw7MDnwwsSgMUf9KUAv0MDvdBWkCxy7
         ccDzYHUIz2upFxNaAGfx2b7sKTSaezE0KmpUq8QByi+o23epMEIDsguAY6iBoYULXgAC
         ErEqJw/bAN9ysVLo04Q6sX7zwJ8qcUM68u+fpsA5ArDvsquteYnW+G5jH5BCyHvuub4/
         4wbMBtksURmdsWS751C9Ga7QtUXW7JATUme+Gp7CbPU+yMehZqtd/r3B/SdSk2jv5bYp
         ytKmD01pygyorvJonD/UCx4fSIsXQoSUzcXsKRxINaDG7zx3Dok+RA0cbaAR6pkD1Fq9
         XjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SGLC/EiGSAvDsOlF3bsOZbU0/go6zOsdONN1AxUVZXI=;
        b=hveh61eQ6nL/gvVDjSH2IA8JwFCMMqiE1lnGNMVCFPkjwpssswxDhCRbiQ1qsEJOro
         7bcRVUoxHc3lt/fU6jyC7U4sv2r85ZyJbxnpCRbq2gd8/QBip6dTl9TfZgaELlyxMnu7
         lJ0RABGV4zXqTt27p3fqu7vh085SbNz+Bv7VoZipcGFZg92vnqp3oZVxFNmjyaoWYVcC
         vE/kRlUNaZnAL865ooecLFKCIJ0RhAvyAE7YgxSt/OXxZCAbwx8W2KEIh1FbatrDEJdT
         VJWMka0ZTS4DM9on5hDsndfE6NIGxR6w7xwMlu73nce6PjLg67aSVVmCp37ob0jKbK8q
         EGMQ==
X-Gm-Message-State: ACgBeo1WRGVpUxLueu6YCZPcE8fgrz1OoeCaC362+4FFOJgFvwI4aeoo
	LWkTnU3WVFp5rPT++zJ3tS10b4lnCqHY2bJ+s44HNYxO
X-Google-Smtp-Source: AA6agR62UuaDxFxzjL9n6JvuSg5C4/sAF4+zJqv9NSZZUVUfF5REi/3cjNWwV5YC1rJ01UZ0xhikmn8xO9f0DJ5n+uY=
X-Received: by 2002:a25:bb86:0:b0:670:ef2:7f9a with SMTP id
 y6-20020a25bb86000000b006700ef27f9amr24473746ybg.318.1660120959033; Wed, 10
 Aug 2022 01:42:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220809171316.1d6ce319@hermes.local>
In-Reply-To: <20220809171316.1d6ce319@hermes.local>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 10 Aug 2022 10:42:28 +0200
Message-ID: <CAKXUXMwRYy8pqLTzfFoxhfS5UvDZEgZ6WxQ_YQcjzdRGmTX3qQ@mail.gmail.com>
Subject: Re: Validating MAINTAINERS entries?
To: stephen@networkplumber.org
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 2:13 AM Stephen Hemminger
<stephen@networkplumber.org> wrote:
>
> Several times in the past, when using MAINTAINERS list either automatically
> (or from manual entry) have found the mailing address in the file is no longer valid.
>
> What about doing an annual probe mail to all maintainers and sending
> a patch to prune out any addresses that auto respond as dead.
> This won't catch ghost entries but would find any dead ones.
>

In many cases, you can avoid the noise of sending out a probe mail,
but simply checking the lore.kernel.org archives for an email response
from that email within the last year.
Many maintainers are simply going to be active, so that.

Then, you may consider just the remaining cases:

Some maintainers use a different email for responding than for
receiving patches. The email address for receiving patches is in
MAINTAINERS, the email address for responding is visible on
lore.kernel.org.
Some maintainers do not even need to respond within the last year, as
no patches were sent to the maintainer's area of responsibility.
Some emails are in fact dead.

Alternatively, you could just offer "a service" for kernel developers
to forward the automated emails from servers, when an email is dead,
to some other email, and then, you go through those and create the
needed patches to MAINTAINERS.

Anyway, creating this clean-up patch for MAINTAINERS is probably still
some semi-automated effort and not fully automatic (as e.g., you
probably want to split this patch going to different subsystem
maintainers and get their acknowledgement), though.

I am also aware of many other clean-up aspects in MAINTAINERS. Just
trying to keep ./scripts/get_maintainer.pl --self-test=patterns
without warnings is already a task that can keep you busy, which I now
know from trying to do so for two or three years.


Lukas


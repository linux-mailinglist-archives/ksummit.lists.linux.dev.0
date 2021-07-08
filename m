Return-Path: <ksummit+bounces-338-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3843C14B4
	for <lists@lfdr.de>; Thu,  8 Jul 2021 15:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id C8F693E10EB
	for <lists@lfdr.de>; Thu,  8 Jul 2021 13:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E8F2F80;
	Thu,  8 Jul 2021 13:54:45 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17BF168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 13:54:43 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id q18-20020a1ce9120000b02901f259f3a250so4089029wmc.2
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OBQ4ywgrCHBr6BQZENmxlj9YAPuRvuhcZH2+WI1yzfY=;
        b=X5QWAYecLlIIN/Z/SEL6AIGETavcMqc71cFxyIsUlmjiaQuqCwAZHvwJqtVSwCSMzT
         DWy2hPSlsZP4jQHVXFigL4D0t3K/qQSIq1+EhLu1Orhkv35ssenUAtLHvJDcClKi6u8t
         fwjGE0WpYm8Tn4i76PgHVUyM+jz/Bz5xw/fkIKh6PbZt0LWFr72qVQuXtTzXZkXrBS8U
         qHYZ+VTE2FB1xCAXZTus99Kw4iHwzoCagi3p3ucPvwtf78oPXDhvM1US6SCOUPpCC1l5
         xYUDAkWeTQ4BqA1xxEQKrQtnaDKvo+5vTVOXEWMK7aLiCfeY01B5XiVuSAxhvpfH4Cad
         kyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OBQ4ywgrCHBr6BQZENmxlj9YAPuRvuhcZH2+WI1yzfY=;
        b=ZRMnbRvcSPcv6vknrLZkxvMuuHDjWnGC0TzulIFkvV4n9kqOpSU3KRm4yMM+615Dd6
         iR9TbawcRWXeCtEEkTQ9oIYUDP60E/ROQ8Ws/vFwA0f7uGqXMvR0Tcr+mcB43OnDwG6F
         qqD5TtxzvviXLGXie2xG/97sC17Wshf6YwJmXqFKWRQTRZNYfIvGeTij2InB/xwdhBZO
         DTMtEbGcLlzsjPk0loASAJmtuw6d8aI688iS+QNWgDyS3qYiqUGO3nSSduLGkYW9oROW
         z0V36uzqMdpC5gkxtMxU+z9xFvJTm82IxDNg3axUuGwSgTBqMH/MgLJfoQTS67CHWpnd
         p8pQ==
X-Gm-Message-State: AOAM530AYovoQpLHU+OVb3XG7p+dVvutTK3MdCcmor7lO+DoFmwfZcTr
	08Z1CSAay+keV4kojR6+Botf
X-Google-Smtp-Source: ABdhPJw2rR1UEMJVz/AwpckwC4jTnjvIkrQrporeQC0t/AdaGp3QUa8v2bGmbZn2htcMPX9C8o+6gw==
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr32903623wma.33.1625752482138;
        Thu, 08 Jul 2021 06:54:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:a098:e45d:317:5eca])
        by smtp.gmail.com with ESMTPSA id h21sm2043155wmq.38.2021.07.08.06.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 06:54:41 -0700 (PDT)
Date: Thu, 8 Jul 2021 14:54:37 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jan Kara <jack@suse.cz>, Greg KH <greg@kroah.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOcDnczZnF4helYJ@google.com>
References: <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com>
 <YOcApBj/puXe3Yig@google.com>
 <CAMuHMdW+zSO25vAriii0hAkvt_SkMhNxvundhAXsgFdmyZ-4oA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW+zSO25vAriii0hAkvt_SkMhNxvundhAXsgFdmyZ-4oA@mail.gmail.com>

On Thu, Jul 08, 2021 at 03:43:28PM +0200, Geert Uytterhoeven wrote:
> Hi Wedson,

Hey Geert,

> On Thu, Jul 8, 2021 at 3:42 PM Wedson Almeida Filho <wedsonaf@google.com> wrote:
> > On Thu, Jul 08, 2021 at 09:20:25AM +0200, Geert Uytterhoeven wrote:
> > > > Weak references need to upgraded to strong references before the underlying
> > > > objects can be accessed; upgrading may fail if the strong count has gone to
> > > > zero. It is, naturally, implemented as an increment that avoids going from 0 to
> > > > 1. It is safe to try to do it because the memory is kept alive while there are
> > > > weak references.
> > >
> > > What does "may fail" imply?
> >
> > Upgrading is essentially calling `refcount_inc_not_zero` on the strong count.
> > It succeeds when the count is already non-zero, it fails when the count is zero.
> >
> > So "may fail" here means "your attempt to upgrade came too late, the object is
> > gone". (The memory is still around so that attempts to upgrade don't cause UAF,
> > but the object is gone.)
> 
> So what happens if this fails?

You move on the next element in your data structure. This one doesn't really
exist anymore; once you release it lock, the cleanup code will likely come and
remove it.

This is a common pattern, see for example (or search for uses of
`refcount_inc_not_zero` and `kref_get_unless_zero`):
https://elixir.bootlin.com/linux/latest/source/net/core/skbuff.c#L4738

The difference between the above and Rust is that in C, one can mistakenly use
the "object" even if the refcount is zero. Rust would prohibit it.

Cheers,
-Wedson


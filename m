Return-Path: <ksummit+bounces-343-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B030C3C151E
	for <lists@lfdr.de>; Thu,  8 Jul 2021 16:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 2A3983E10F4
	for <lists@lfdr.de>; Thu,  8 Jul 2021 14:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914102F80;
	Thu,  8 Jul 2021 14:24:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9D2168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 14:24:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id y21-20020a7bc1950000b02902161fccabf1so3652278wmi.2
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PTqm8OjCRfACUqX/tGgkG3GjAIFdhQ+FZCRUC5qHmbg=;
        b=DzHNXieH4ndzUFwgM4qYKrNr9xuoVYuENOyZ4CaW7M3rZAgWiEwOoFXqb1uGb4o7Ev
         KUwg2cIGe7y4BrCfy7qaXwEZzrmx3at3hID/CU7i8zR0xI+1yTP5zjgww6bN1Or8tdIu
         P/GzZx71vKY29cWfFl4fR55ymr/rYaRon6yr+H5/OumIDSrtBCTspkw5KbGXtKJ+pYTv
         gscDHiKSPMgaUi/c0m/WE8UFm6U3xSzSs20hFDqGeWR2Vhg6czIgpXHW1TqSWEmXfq1A
         6b8d6mbGFFJgXkD9Ish06S50bM74s+e4MgBV1Vc3pHnq6QiV92NuHdNN0253GQsSTkNd
         gkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PTqm8OjCRfACUqX/tGgkG3GjAIFdhQ+FZCRUC5qHmbg=;
        b=BCu13geQ50mwaqlpxvvVy2p1iQkr4H+RB09KzFVc402Puh2Bjcml7N+2H7GM2VyC8D
         WYaZ1L/ZAVWm7G8We3FzM+hC4bf9BBKGGkXUVWDuNaWH4ZBL7EkJK7EDKnj1vy1nZbnH
         1oXTydVXggmwHsXydE7WJDnhwRaCW1rZaZBkXKJ+mNT3YMOxBlp4FbOErCXUscelLHRm
         sujKe5AQbCHvnZ51kuAcKY4AYFYSnWNXjqbKLrsDprXof2TDeN9H1iYRSd8RdJP1nnDB
         4+R935cajiTbz9/lhlrQJP4NIaKl1YiUtBTkCg+msu+/ltqBGC5KI8fRzhRMGfIB2jT+
         P9KA==
X-Gm-Message-State: AOAM533Hv2SpJnMsATNdjwV3rrhvnlAyR+Ki15Sqbb2/43KDNf221VcX
	EMA/S+JaAz14LOzXNhe8tN0r
X-Google-Smtp-Source: ABdhPJw+XfxzgNsTENytQKIBe5gqyoSws6oMdzTxHMZTcIxowx6Xj6kRIhxs+1YdGSrVEuRGKGkIeA==
X-Received: by 2002:a05:600c:358d:: with SMTP id p13mr5867062wmq.12.1625754279488;
        Thu, 08 Jul 2021 07:24:39 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:a098:e45d:317:5eca])
        by smtp.gmail.com with ESMTPSA id b16sm2421218wrs.51.2021.07.08.07.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 07:24:38 -0700 (PDT)
Date: Thu, 8 Jul 2021 15:24:34 +0100
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
Message-ID: <YOcKog8mBdl3LUv6@google.com>
References: <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com>
 <YOcApBj/puXe3Yig@google.com>
 <CAMuHMdW+zSO25vAriii0hAkvt_SkMhNxvundhAXsgFdmyZ-4oA@mail.gmail.com>
 <YOcDnczZnF4helYJ@google.com>
 <CAMuHMdULCT3P6emoD08pEAt8ZZz0-FFwEOEuYXhcstisM==ZLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdULCT3P6emoD08pEAt8ZZz0-FFwEOEuYXhcstisM==ZLQ@mail.gmail.com>

On Thu, Jul 08, 2021 at 04:16:54PM +0200, Geert Uytterhoeven wrote:
> Hi Wedson,
> 
> On Thu, Jul 8, 2021 at 3:54 PM Wedson Almeida Filho <wedsonaf@google.com> wrote:
> > On Thu, Jul 08, 2021 at 03:43:28PM +0200, Geert Uytterhoeven wrote:
> > > On Thu, Jul 8, 2021 at 3:42 PM Wedson Almeida Filho <wedsonaf@google.com> wrote:
> > > > On Thu, Jul 08, 2021 at 09:20:25AM +0200, Geert Uytterhoeven wrote:
> > > > > > Weak references need to upgraded to strong references before the underlying
> > > > > > objects can be accessed; upgrading may fail if the strong count has gone to
> > > > > > zero. It is, naturally, implemented as an increment that avoids going from 0 to
> > > > > > 1. It is safe to try to do it because the memory is kept alive while there are
> > > > > > weak references.
> > > > >
> > > > > What does "may fail" imply?
> > > >
> > > > Upgrading is essentially calling `refcount_inc_not_zero` on the strong count.
> > > > It succeeds when the count is already non-zero, it fails when the count is zero.
> > > >
> > > > So "may fail" here means "your attempt to upgrade came too late, the object is
> > > > gone". (The memory is still around so that attempts to upgrade don't cause UAF,
> > > > but the object is gone.)
> > >
> > > So what happens if this fails?
> >
> > You move on the next element in your data structure. This one doesn't really
> > exist anymore; once you release it lock, the cleanup code will likely come and
> > remove it.
> 
> I'm confused. Which next element?

If you have a list of weak references, like in the original example, I'm
referring to the next element of the list. If this is just a field of some other
struct, then you're out of luck, you have to act as if the object didn't exist.

> What happens if I have a weak reference to an object that cannot be
> upgraded to a strong reference, and I try to access the object?
> E.g. read from or write to a member of the object?

You can't by construction. The returned type would be `Option<Ref<T>>`, so to
access the fields of the returned object, you need something like:

    if let Some(obj) = weak.upgrade() {
        // `obj` is accessible here, you can access the fields.
    }

That is, if `upgrade` returns `None`, then you don't have a way to access the
fields of your struct. This is similar in concept to locks, where the fields of
a locked struct are only accessible when you acquire the lock.


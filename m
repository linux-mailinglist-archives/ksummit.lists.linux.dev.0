Return-Path: <ksummit+bounces-1960-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE89A46DCD
	for <lists@lfdr.de>; Wed, 26 Feb 2025 22:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BF5F188D7AB
	for <lists@lfdr.de>; Wed, 26 Feb 2025 21:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBD825B669;
	Wed, 26 Feb 2025 21:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FA7rHIKB"
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016F258CE6
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 21:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740606172; cv=none; b=ayFp+Frpggx6fUn4FfbOjFWqP4W2llfVjePaMzNeYqjDQiKVFDaZWzfTeV1mIrSore2ZNRAB1BbrKLlGjGhzvLAtlwFkt7cYk3YD0mwy52nylHjUqJbBL3T6yNSaoFqpvaYgGiS4QIwEdbR8M634x5pzbGTEQZ24vJly6cQc9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740606172; c=relaxed/simple;
	bh=joVlM9Oxd8UHscjQG38CfBVUrd1wTQ59FM/22gfbBMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzUUtCQCF3SJBizOWahS9FbGswCaIJnyYGxUhAAI6487D0im7wwHj8J/DFFfKFrsRAIWYOnTkwFL3xuEy7dJi6zyJXyyIhqg4JJaIX2Q8OTx1tjGu3K1wl51YzdEK37rVMLC3rmdKA7yOEruceF+TI2+7FAtL5XS7ABblRKFFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FA7rHIKB; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so344299a12.0
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 13:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740606169; x=1741210969; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6vkIlnQJGQMWO96KVR0qNL+LIULnDs79lQffNbO4YK8=;
        b=FA7rHIKBh+iLagft64qGCMY2nrI3YU86/M5ALj031jyWsPI2h82omO71kuwJNbG/yl
         T868/zxJmwTdFuwUfNas3+x//0lE2E2NuYWrlE3jXDmfSDK18ttOWJy5w2lQGKI4Cuw5
         TetytgTCgdMgFzANLMjsJdTJK52Djb40b1VAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606169; x=1741210969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vkIlnQJGQMWO96KVR0qNL+LIULnDs79lQffNbO4YK8=;
        b=qhqhsgbkQ/yubAGnuw09yO89LX2vyzIDH8hZNnLsRZoFqh+zqW3GbPa191EKWaPW/F
         ix5FewOCQkwAQIGgBfvA4rj1ixjbGQVVragJf+cjXxXeZlgwFu6ijp0mOTwESufQwmjQ
         w6OEobYdgfU7PuMWjqyXxpy1m1i2UCukKsiaqQoG4UwUa17ElXosSrlTwGmavLgZ1E1M
         sMkcclPrExjTCDuTPXhaxYxCkBL5Tef8lAG6wQRRTmfvC5ZqucRAHJCPP2RsdnpwLE+f
         kOgOzwJ2ykOF8irM9nOC9Qbcd8gEm3+W6AUmT1GXbYWoZVvwF+4iyqMb5kdfcmOmhnRY
         OsSw==
X-Forwarded-Encrypted: i=1; AJvYcCWkOG6dYU2v739d6gzp5Hop8RQGhtqvXiFTvqIAWW29ySoDYVQWNWGtKVSB7CNfVtPNVt3q3jR3@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ3nYWFvVdRT34EuXCpFOfqOzA0QhtXKBCwq7MY2YOttkcb4DP
	txf18oMkttnGGEWk22ygoCC3sH9BhJ0hnfevVTxqKUwaw9MgcJKTgxyWAjTfcA9Vj8MeQ/NHa/c
	90teWQg==
X-Gm-Gg: ASbGncu5wZCmGAiCoHducwhfjSu8xcgEjPnt/7wHaurwexOQC8fp8gTVfcpXnHDvRt0
	h85U6XbuIzEqAi+7hleKE9qwnPibdRQ1D6cgZZtednm3iz9S7wo5KVwMjUSR8BE8jJ5Xv3KNuQ9
	md1HMMvsRJ6jmgII2cI0qqGhlnRD6rREvx0I1qeuIQf3cfzyEw+qSjGHHzuf4hu4gs71F19QBPR
	XMbXcRdrfVQV3XEJWDDKFvsqqadfDnKjkK6XaQiRhyHBoeCepIRaZbsAfxUyyaK0es5wJZDjHYx
	jGMKqj8zZeKlhPVn3/nrrXZDqR4gH6UWapvVpQ652BVGd1krMEOySdCe8D4+QreXf590gi1v2+V
	N
X-Google-Smtp-Source: AGHT+IErjUW9m0bBHyn1aZ34WZ8uGihFGMhLZzpqHXWooXN3wmfRLSeqXA3JE2qkXf9QjRztsLG7cQ==
X-Received: by 2002:a05:6402:280d:b0:5e4:a88a:64e with SMTP id 4fb4d7f45d1cf-5e4a88a0790mr5154832a12.5.1740606168920;
        Wed, 26 Feb 2025 13:42:48 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4aad0sm74979a12.2.2025.02.26.13.42.46
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 13:42:47 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so275048a12.3
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 13:42:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbscZVGVuP6iS3fk9pQ5MdRFHKcRZqJt4unvCR/fFZqmYidfmUFBZfxYG5meo77oYmy3+cHYOo@lists.linux.dev
X-Received: by 2002:a17:907:d16:b0:aa6:b63a:4521 with SMTP id
 a640c23a62f3a-abc0d9dd9ecmr2539199666b.15.1740606166076; Wed, 26 Feb 2025
 13:42:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com> <20250226162655.65ba4b51@gandalf.local.home>
In-Reply-To: <20250226162655.65ba4b51@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 13:42:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
X-Gm-Features: AQ5f1JrEbuV6Jnfb71LIwDoIVXl971WHAwc1W1BbVzsqQnjOHGkQlzERgSNPg2U
Message-ID: <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin Uecker <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 13:26, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> As a bystander here, I just want to ask, do you mean basically to treat all
> reads as READ_ONCE() and all writes as WRITE_ONCE()?

Absolutely not.

I thought I made that clear:

 "IOW, doing CSE on reads - and combining writes - when there aren't any
  aliasing issues (or when there aren't any memory ordering issues)
  should absolutely be considered ok.

  And doing speculative reads - even if you then don't use the value -
  is also entirely fine. You didn't introduce any observable behavior
  difference (we'll agree to dismiss cache footprint issues)"

all of those basic optimizations would be wrong for 'volatile'.

You can't speculatively read a volatile, you can't combine two (or
more - often *many* more) reads, and you can't combine writes.

Doing basic CSE is a core compiler optimization, and I'm not at all
saying that shouldn't be done.

But re-materialization of memory accesses is wrong. Turning one load
into two loads is not an optimization, it's the opposite - and it is
also semantically visible.

And I'm saying that we in the kernel have then been forced to use
READ_ONCE() and WRITE_ONCE() unnecessarily, because people worry about
compilers doing these invalid optimizations, because the standard
allows that crap.

I'm hoping Rust can get this right.

               Linus


Return-Path: <ksummit+bounces-1765-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83854A3DF4E
	for <lists@lfdr.de>; Thu, 20 Feb 2025 16:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC1CA3BEF11
	for <lists@lfdr.de>; Thu, 20 Feb 2025 15:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EB31FA14B;
	Thu, 20 Feb 2025 15:50:02 +0000 (UTC)
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282A98F5B
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066602; cv=none; b=BCdzUIJU4CkoaDP3ZCTSJe3QHeAgu7SWjD9L/ACvK80jR36zU2LfH505DdeQB3emp1FZ300r4SKVPWFWvMVKXqBaJS/aWFPfnql3ENSekhGjmbK3t+MynTVdW0M0K7tQwBcfotwxoTuAu9HxCr1C9n2mI4OAEgrjRaHizF8SeVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066602; c=relaxed/simple;
	bh=k27A0ZEoTITv/+qTr8An/1tIJzsKgrmcslb/obw9cWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOGITcJZLAyd/8Kn0TJ6U5pOXzpJbZe88PI2rNOx4TMpdSZxNjjloYrHLgsLq81+BRJPNpu11ZmnUIhm9Ulh8M5UTvQcAFDAXq1rgIeHiYPgL1WPavfsfKuBpXUexf1b69qMUA56tca45ud8P1b7GtAXIvDhHOaZGVFW0cNb4Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 51KFnfo7032530;
	Thu, 20 Feb 2025 16:49:41 +0100
Date: Thu, 20 Feb 2025 16:49:41 +0100
From: Willy Tarreau <w@1wt.eu>
To: Martin Uecker <uecker@tugraz.at>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Boqun Feng <boqun.feng@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
        ksummit@lists.linux.dev, Justin Stitt <justinstitt@google.com>,
        Kees Cook <keescook@chromium.org>
Subject: Re: Rust kernel policy
Message-ID: <20250220154941.GB31777@1wt.eu>
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
 <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh>
 <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh>
 <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <962fa158-5315-4d93-afb1-8a1c08787ad8@stanley.mountain>
 <1f31a16d3898e0e9b5d94f9bcc12a1b73ac97982.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f31a16d3898e0e9b5d94f9bcc12a1b73ac97982.camel@tugraz.at>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Feb 20, 2025 at 03:09:21PM +0100, Martin Uecker wrote:
> In general, if people have good ideas what compilers or the language
> standard can do to help, please talk to us. It is possible to
> improve compilers and/or the language itself.

I'm keeping that offer in mind, as I regularly face in userland many
of the issues that are manually addressed in the kernel. The problem
clearly is both the language and the compilers, we can improve things
and I know that you need some feedback on this.

Thanks,
Willy


Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 309387E2B5F
	for <lists@lfdr.de>; Mon,  6 Nov 2023 18:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DED5928111A
	for <lists@lfdr.de>; Mon,  6 Nov 2023 17:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C562C84C;
	Mon,  6 Nov 2023 17:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I4SXej9V"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C829D0C;
	Mon,  6 Nov 2023 17:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9201DC433C8;
	Mon,  6 Nov 2023 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699292479;
	bh=YmTsZkG18GWUeGd4RqDZDXnefCXSwr3/JE2f/JJXRqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4SXej9Vr4UiueT//DAlR5t4NJxFY5+H56PN60NhTL5ucy08yRTRQyFLEuZajWWdi
	 TOH8ee98HRMZ5DWvsM575hG5kCFyS/34VnBZiCTlvqkrW/Mc9eHJsejt5Y098iiFeX
	 q9fDCzk1vmFQ8qvKOsO1VUb46eCyoPovdScPJP7g=
Date: Mon, 6 Nov 2023 12:41:18 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, users@linux.kernel.org, 
	ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231106-mega-albatross-of-beauty-f2a7e9@meerkat>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <87r0l2yi7v.fsf@email.froward.int.ebiederm.org>
 <ZUkcyCb5DEVEDkKj@infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZUkcyCb5DEVEDkKj@infradead.org>

On Mon, Nov 06, 2023 at 09:05:12AM -0800, Christoph Hellwig wrote:
> > > - due to the sheer volume of messages, LKML is generally seen as useless for
> > >   holding any actual discussions
> > 
> > I have never had that impression of LKML.
> 
> Same here, I am actually reading through lkml, although superficially
> skipping over some bits, and definitively starting discussions there.

Hence my use of the word "generally."

> Restricting access to the new lkml is not acceptable.

It's not the "new lkml" -- the LKML is still there, it would just no longer be
a dumping ground for copies of all patches.

I also intentionally wrote "pre-moderated" instead of "restricted."
Subscriptions are still open, we just request a valid reason why someone wants
to receive copies of all patches.

> How about restricting access to all lists for gmail addresses if gmail is so
> broken?

Today it's gmail, tomorrow it's something else. Just a month ago all services
using outlook.com were broken for days:
https://learn.microsoft.com/en-us/answers/questions/1388775/outlook-com-servers-tells-server-busy-please-try-a

All I want is to know is why someone wants to receive a copy of all patches
via SMTP when much more effective mechanisms to achieve the same are
available. If someone can provide a valid reason -- such as being a
high-profile maintainer -- then of course I'll be happy to let them subscribe.

-K


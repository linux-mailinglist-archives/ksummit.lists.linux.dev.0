Return-Path: <ksummit+bounces-2195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39701B3084C
	for <lists@lfdr.de>; Thu, 21 Aug 2025 23:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D41673BB5ED
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ABA2C0269;
	Thu, 21 Aug 2025 21:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkgYc2+y"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1630393DD3
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755811421; cv=none; b=QoLmeI5N6sQ2/hDL4xYuPAI5V1LK+BbSZnnrJtnisyj7zzvHHwgy+l1MTcwUZxsu9EOxvjwLoSh8HGLl+WxlTlHpajbgELyhPImTgb4CqfuQXvXsbS4FZ7woGhZCRsc24BJHSfD6pYtch3mXMpbVOUYK9iKgoocS++6y0ExYndI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755811421; c=relaxed/simple;
	bh=ZqnS4GwAqiLA7SI/kH4eBrjENcrficzDS3cw+J4TiyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYHbGpnkjiwo2O1YueOsKUzoiIDoboJSZacPMg6xrSbwd/UZnLX2eCZAS3uCBgR73vM0cj9rvHQ0/Y47fbqD3CSe5/DO1+a9d/U2/1Akr7U1X+82TjBn+MVl5cqKJ15XcewBbAhATnkKiqFBDdU1QUlodAlc3DxG+xhKy1xIlLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkgYc2+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB9EC4CEEB;
	Thu, 21 Aug 2025 21:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755811420;
	bh=ZqnS4GwAqiLA7SI/kH4eBrjENcrficzDS3cw+J4TiyQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=UkgYc2+yd99mTSoXpNb/YkLGXp5l0NPB16tz1g5tj+weC8wUEzhBa+u52qg627am4
	 3fdZTBH3FJauZiGDhcjI5A93sh2ovy0TZ+kgxzuD/Fi4khLmJnvWlZ0fAIpT73Mh4/
	 YuIu06UMP44xeUm1pW+RBGa1XMAfrQQCv9LKTd8fJbuaat5h0zTkUqXxyBXgYDXWU0
	 K4ls8ST6wQPK4IfI/yxlZ+26ERB/7zXz7/83WC2XGavdRMuhpRINvOfh5HMX24Dhos
	 hhp65cXPt6bsoGxX7ivtKZ35p7mGvQpCmNUa04YUw7sc5oidTgNqXvbrsbEw8aqyDF
	 61h4JqKi0dXKw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 296F9CE0854; Thu, 21 Aug 2025 14:23:40 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:23:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <01ac1a43-a70c-4a36-bb02-8fc1991d3f4a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
 <4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
 <d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
 <20250821122329.03c77178@foz.lan>
 <20250821125037.5cf5be3d@gandalf.local.home>
 <20250821193041.398ed30b@foz.lan>
 <20250821135329.16dad71e@gandalf.local.home>
 <20250821203259.2097c63b@foz.lan>
 <20250821150757.26813600@gandalf.local.home>
 <20250821215229.5f4ed387@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821215229.5f4ed387@foz.lan>

On Thu, Aug 21, 2025 at 09:52:29PM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 21 Aug 2025 15:07:57 -0400
> Steven Rostedt <rostedt@goodmis.org> escreveu:
> 
> > On Thu, 21 Aug 2025 20:32:59 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > 
> > > Btw, even in the case of a bigger pattern you saw there and you
> > > may be repeating, you won't be the only one doing it: an entire
> > > generation that used K&C textbook are also repeating them. Plus
> > > the ones that used newer books whose authors got inspired from
> > > it.  
> > 
> > Since the authors actively encouraged people to use their examples, there's
> > no incentive to go after anyone.
> 
> True.
> 
> > > In practice, even with the original book's copyright, I doubt
> > > anyone could actually enforce copyrights if one picks one of the
> > > book's code and use as-is (and more likely one would adjust
> > > coding style, parameter pass logic, etc).  
> > 
> > I'm not so sure. But since most people who write coding books want people
> > to use their work, there's been no precedence on someone going after
> > someone for using code from a book (that I know of).
> > 
> > But there's a lot of assumptions in this thread, and I fear that those that
> > take a too lenient approach to AI may get burned by it.
> 
> AI is new, so yeah, there's always a risk. But then again, there's a
> risk already without it. I don't think the risk is too much different.
> Perhaps it is even lower, as all major companies are investing in AI,
> and they don't want to be sued. Plus, they're much more interested on
> the direct revenue AI can produce for them. So, probably there aren't
> much intent to try costly legal actions with low chances to monetize
> by going  after people using AI.

Let's please be realistic.  There isn't just a tiny bit of legal risk.
Instead, there are multiple lawsuits currently in flight on the status
of AI-generated material.

							Thanx, Paul


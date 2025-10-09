Return-Path: <ksummit+bounces-2471-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE7CBCA6B1
	for <lists@lfdr.de>; Thu, 09 Oct 2025 19:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7815248136B
	for <lists@lfdr.de>; Thu,  9 Oct 2025 17:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A12242D84;
	Thu,  9 Oct 2025 17:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0MSz1F9"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331AC227BB5
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 17:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760032077; cv=none; b=P1A2ynHpOfqSEGrsfRkVMHbNGt6xYc16XDfEwSBNfGIOvZt9juoNaCbNcHQ647g0q/vF0KubykgaW/hr6+Ry8UIxuKp0ypz9YCAAmTCozgrUKYcdmClPWcQnG5cFWcq3YeP8G1xVMU4zssBmDaBKzkyYe2j5Y0Va+vCcITbbFqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760032077; c=relaxed/simple;
	bh=WBlDbs0gxq391PfA9JyKEHkPA1WWC6Y70o6c9bj9n80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpjGv95vTxyEvCCA4WvmQoRveVajhMT9LN5eIKeU1xZdz9Zg/90ofldTYRHl/jrssqCW+46Vbu+mjXsOinBQci2ndw8zXf4tTPnshkCFO4K5cAwFkYpxaRTOckE+v3wMa6X/0XttrtEMZq1FaPpYHh7JzKZ3Eu6iBsyU4a6yU0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0MSz1F9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E731C4CEE7;
	Thu,  9 Oct 2025 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760032076;
	bh=WBlDbs0gxq391PfA9JyKEHkPA1WWC6Y70o6c9bj9n80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I0MSz1F9kOZcFEq7Q82qUcvzdO4EQhdWaNf2qN8HZRBZr26COnAqlJv1MgOZ/Ree6
	 1UKorZoO79BS2hflb4obQ8yefCwmEF9ZMv6Ey1GbgMnJqHcRrj0W21tBfRhpY4AGAP
	 9EvjzQU+kqKsovLyhRSmfXndhbYnd5snVpLjzgRte/gN0EYS9wRElMIeTmkVFxA7XI
	 OEDxtljwBnXQRZF1Gk5L+Xx7r7BjuOtmomkgA5B9SkesoTgg7ZbqvU9ipDb7KVa1wT
	 Dc9uWoL9/ierX85dWaNNR6Lv127eB5S1CCXsMxmMTWbFKLbuSmBvfS+El1vjiHWjUb
	 whetoMWpiJ0AA==
Date: Thu, 9 Oct 2025 14:47:54 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Chris Mason <clm@meta.com>, Steven Rostedt <rostedt@goodmis.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Bird, Tim" <Tim.Bird@sony.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aOf1Sv0vWddGAn_J@x1>
References: <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <20251009103019.632db002@gandalf.local.home>
 <3f25bd06-a75f-4de8-b8f4-f92dffb62f09@meta.com>
 <aOfuu8InYEUIZdWH@x1>
 <aOfvuqPNLtBPlc2r@x1>
 <CAADnVQJjqgrfLo3pcFYDXJ9x6ieDoeJEroWRCSG1cVahH8AMnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJjqgrfLo3pcFYDXJ9x6ieDoeJEroWRCSG1cVahH8AMnw@mail.gmail.com>

On Thu, Oct 09, 2025 at 10:31:10AM -0700, Alexei Starovoitov wrote:
> On Thu, Oct 9, 2025 at 10:24 AM Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> > On Thu, Oct 09, 2025 at 02:19:58PM -0300, Arnaldo Carvalho de Melo wrote:
> > > On Thu, Oct 09, 2025 at 12:31:48PM -0400, Chris Mason wrote:
> > > > On 10/9/25 10:30 AM, Steven Rostedt wrote:
> > > > > One way I see this working is to attach it to patchwork. Sending a patch to
> > > > > the BPF mailing list has their patchwork trigger a bunch of tests and it
> > > > > will tell you if it passed or failed. I'm assuming if it failed, it doesn't
> > > > > add it to patchwork and the maintainers will ignore it.

> > > > > Attaching AI to patchwork could be useful as well. But this would run on
> > > > > some server that someone will have to pay for. But it will not be the
> > > > > submitter.

> > > > Just to clarify, that's what already happens with BPF today.

> > > > Ex: https://github.com/kernel-patches/bpf/pull/9962 are all from the
> > > > review prompts.

> > > This almost relieves me from the guilt not to have reviewed that series
> > > from Alan ;-\

> > But this goes back to "developers should run these tools before
> > submitting upstream", which would provide them with reviewing comments
> > that would improve the quality of their pull requests by using all the
> > money that is being dreamed into AI and would saved all of us from
> > looking at github, etc, before AI is satisfied with the quality of the
> > submitters work?

> > Its all about what should distract maintainers (humans?), no?
 
> Our next step is to send them as plain text emails, so that reviews

Great!

> will blend in into natural kernel development process:
> submitter send patches, AI and/or human replies, submitter replies
> and insists that their code is correct and AI/human is wrong,
> or admits the bug and fixes it in the next respin. And so on.

Right, the thing I see making lots of people not trying to see AI as a
helping hand is that they do some one-off attempt while crossing their
hands wishing not to get a good answer. When they get a good answer they
think they are "cheating".

This is a knee-jerk reaction, focus on how you can get rid of mundane
work.
 
> Chris did a tremendous job in reducing false positives.

I have not tested it, but people in my team have and gave me great
feedback, we're on it!

> These reviews were proven to be quite accurate and spotted
> bugs that maintainers didn't. In a few cases the maintainer
> found a bug and pointed it out, but AI explained the bug better.

I'm a believer, there is help to be obtained from all this, lets reap
it.

- Arnaldo


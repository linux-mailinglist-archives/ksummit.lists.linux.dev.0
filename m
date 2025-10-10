Return-Path: <ksummit+bounces-2485-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A98BCDE64
	for <lists@lfdr.de>; Fri, 10 Oct 2025 17:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 31DE0500C4E
	for <lists@lfdr.de>; Fri, 10 Oct 2025 15:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275A426A091;
	Fri, 10 Oct 2025 15:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmZ3KrJ0"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A98B25DAF0
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760111589; cv=none; b=PzoJOhNVLUXsabqeRdbPPgH+9fLA1abawKgnLrpyN/XZEn/zUaJcZ7RtUcEdTd7ELqffqGY2PiUILx0ltwSah+xuW43DIWA/ChKtOh4yIiJDUjytBjFIUmgkSHEiEC5ITnsHnnsc7+kRebL+7e0bk7eMW3rl2RfITNulqv3lEq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760111589; c=relaxed/simple;
	bh=CuO+YQ1TFvMMOM5jshy1zkzKUlVl+T7bb2+C5IEiQXc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MfD3FO1LLh+bWDKIQxFCZDqJdeQdmmoeawL6Fmtt033fsi1mcV2Hr1k/7lsldRF0i+ipcEhKnPLbE41ghii9wlXd3VLOA+Y/2X2I6N4diqGDdpKBfURKjB2rsm0aolHoa/FGbmGdTmi3REyWZ5NNzJ9e/S3+sz3gNpk0WpKqckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmZ3KrJ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B7AC4CEFE;
	Fri, 10 Oct 2025 15:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760111589;
	bh=CuO+YQ1TFvMMOM5jshy1zkzKUlVl+T7bb2+C5IEiQXc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HmZ3KrJ0xvHE/eD5pxAwUQlRzlOw0/MZO7Asgk4p5m1+jCIUmMT3VWOhrGBOfl7rX
	 kNMtj7Ds2o+sPETDQfI6nEuYqq/rEOfHUoSH28kNwy6O2F0mEH3nqTlBHH53ItXmLB
	 E33FQRSfrpblYzfGAGc9pVkz9yJshDD6DTi0uMvV6W3/nEPfKzejieImHC4tDcXbTx
	 6DZxaZiskIYkiclhnnop2rZZ7iMl2u70Jhpd5ra6uDKpnA7rY9uOysKLmluyRVC0lU
	 +z8Je3rhvCaKqKPW/Eg8NRnzof+fJHYyZlaQnNgcv7MMni9ks9/t0rtGduM0v1TojA
	 IY0AARmnllmxQ==
Date: Fri, 10 Oct 2025 16:52:59 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Chris Mason <clm@meta.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "Bird, Tim" <Tim.Bird@sony.com>, James
 Bottomley <James.Bottomley@hansenpartnership.com>, Andrew Lunn
 <andrew@lunn.ch>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Dan
 Carpenter <dan.carpenter@linaro.org>, Alexei Starovoitov <ast@kernel.org>,
 Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251010165259.36fd0416@sal.lan>
In-Reply-To: <CAHk-=wj3fQVEcAqy82JnrX2KKi4NjnEGGSH2Pf_ztnLCcveWkQ@mail.gmail.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <20251009103019.632db002@gandalf.local.home>
 <3f25bd06-a75f-4de8-b8f4-f92dffb62f09@meta.com>
 <aOfuu8InYEUIZdWH@x1>
 <aOfvuqPNLtBPlc2r@x1>
 <72b9b81c-765b-4047-bb3b-40b2a8a6e563@meta.com>
 <CAHk-=wj3fQVEcAqy82JnrX2KKi4NjnEGGSH2Pf_ztnLCcveWkQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 9 Oct 2025 11:56:23 -0700
Linus Torvalds <torvalds@linux-foundation.org> escreveu:

> On Thu, 9 Oct 2025 at 11:43, Chris Mason <clm@meta.com> wrote:
> >
> > I think it's also important to remember that AI is sometimes wildly
> > wrong.  Having the reviews show up on a list where more established
> > developers can call bullshit definitely helps protect against wasting
> > people's time.  
> 
> I really want any AI effort to be primarily geared towards
> maintainers, not end developers.
> 
> And this is a large part of the reason. I think we've all seen the
> garbage end of AI, and how it can generate more work rather than less.
> 
> We see the downsides on the security list where people use AI to
> generate questionable reports, we see it in various general bug
> handling, and we've seen it on the infrastructure where the AI tools
> cause huge issues.

I recently read an article about LLM Needle-In-a-Haystack issues
with current models(*). The problem is that, even when they do support
big input tokens (with is proportional to the number of statements at
the program code), current AI models usually loses needles (for instance 
a bad code) when the context is bigger than just a small percentage
of the maximum context(*).

(*) I didn't save the link of the article I read, but this one
    https://arxiv.org/html/2406.10149v2 is somewhat similar.
    Basically, even when the model supports large contexts,
    the probability of losing a needle in a stack increases
    with the input size in a way that, even a relatively small
    input can cause false negatives. See this comment at figure
    1:

    "GPT-4 effectively uses only about 10% of the full 128K window."

So, yeah, if one uses AI to review patches, there is a high risk
of mistakes, meaning a maintainer or an experienced developer is needed 
to review "AI reviews".

> Fairly recently Jens gave up maintaining his own git server just
> because of the horror that is AI scraping tools.

This is a different issue. I needed solve such issues on linuxTV.org 
as well. The problem there doesn't seem due to someone giving AI some
prompt, but, instead, due to bad automation used by LLM training
that behaves like a DDoS attack, trying to retrieve all possible
existing and previously-existing pages continuously, using
multiple connections and from different ip addresses.
> 
> Yes, that scraping issue a "secondary" kind of "more work rather than
> less", but it's very much a real issue nonetheless. Just the
> infrastructure load is a real thing.
> 
> Some long term goal may well be to help end developers, but I really
> think it should not be seen as any kind of primary goal for now and
> shouldn't even be on anybody's radar as a design issue.
> 
> Exactly because I think we need that "established developers can call
> bullshit" without being overwhelmed by said BS from external sources.
> 
> So I think that only once any AI tools are actively helping
> maintainers in a day-to-day workflow should people even *look* at
> having non-maintainers use them.

For bug reviews, agreed. AI can still be helpful for developers to
do things like writing unit tests and more trivial tasks, provided
that will be reviewed/fixed by the develper using such tools.
> 
> And I say that as somebody who does think it's going to be a big help.
> I know there are lots of less optimistic people around.
> 
>              Linus
> 


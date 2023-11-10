Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A48047E7E17
	for <lists@lfdr.de>; Fri, 10 Nov 2023 18:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F734280FB4
	for <lists@lfdr.de>; Fri, 10 Nov 2023 17:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0F5208C7;
	Fri, 10 Nov 2023 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xGAiSyBT"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795C620338;
	Fri, 10 Nov 2023 17:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE40C433C7;
	Fri, 10 Nov 2023 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699637046;
	bh=RdvOK+eFrUKhD5y8OzGW7t9qucsjT2tjJ30UvRMSIf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xGAiSyBTgryqZATU+LMTbqK1q0QL4lz5kcBa1c8mle+fRc1jrkAT+AiWLGbQpSCb8
	 6fC9cCCgscnFkHH2zIqZvZb62kFjgXoqql85MeEtJBaTYURhKcF9Er1Uymm3BppEv8
	 MxteH+RYBbqdmFusUmsnalrnMjFyB9nEnjKwn12w=
Date: Fri, 10 Nov 2023 12:24:03 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Joe Perches <joe@perches.com>, Alex Elder <elder@ieee.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, users@linux.kernel.org, 
	ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231110-poetic-weightless-hawk-abbee2@nitro>
References: <20231108140415.46f84baa@gandalf.local.home>
 <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
 <20231109092701.GG21616@pendragon.ideasonboard.com>
 <903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>
 <ktmwnywdfziwkngd7exd2rmfzf3ozsws6o3u4hzch3r6ckefvs@a7pehvrsz7ii>
 <7ebbd98a64b581b42a93720896dc104398f5d322.camel@perches.com>
 <20231109-soft-anaconda-of-passion-5157c7@nitro>
 <20231109231633.GI4634@ziepe.ca>
 <CAHk-=wgskvYEw3RtsPSkzm=0aQA4hKT2+GOb2u6apcaW=8_i4g@mail.gmail.com>
 <20231110090446.479f4cf5@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231110090446.479f4cf5@kernel.org>

On Fri, Nov 10, 2023 at 09:04:46AM -0800, Jakub Kicinski wrote:
> On Thu, 9 Nov 2023 16:56:33 -0800 Linus Torvalds wrote:
> > Developers might even be able to sign up to "virtual" lists, where
> > they get cc'd if a patch makes it to that list that has a file pattern
> > that matches their "I'm interested in these path patterns".
> 
> Yes. Please.
> 
> Could we possibly make that work via IMAP, inject the emails into
> people's inboxes instead of via STMP? It may break local filtering
> and would require that people give k.org passwords / API keys.
> But we won't be running into the STMP rate limits any more.

Search-based mailboxes are coming Very Shortly Now (TM). It's mostly down to
the logistics of how to let people self-manage the queries (probably via git,
because this gives builtin history, rollback, etc).

You can already feed entire mailing lists into Gmail via POP3, so very shortly
you'll be able to define your own query (to run against /all/) and have that
available to you as a NNTP feed and a POP3 mailbox. I chose to start with POP3
because Gmail has a native mechanism to import that into your inbox. I've been
receiving the git list this way for the past month.

-K


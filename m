Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 102787E7DF6
	for <lists@lfdr.de>; Fri, 10 Nov 2023 18:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8671CB20D97
	for <lists@lfdr.de>; Fri, 10 Nov 2023 17:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FAC1DFE5;
	Fri, 10 Nov 2023 17:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dL3b4HV9"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C1363B4;
	Fri, 10 Nov 2023 17:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1226C433C8;
	Fri, 10 Nov 2023 17:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699635888;
	bh=2DzH0CDYgp0S5j7IiVJ9Q3bu4DGOoI/E8tC+PsmG0R4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dL3b4HV9jGIFdVle632fyGZN/d9P/i1MHpn2bqUKfm4LOLAt2epjuoch0vOHfvQZW
	 U6s05A3Z+jb3ak8jveK4HaQmwGglS35B+Gv+s7U+Vr5Q8cdpTg/cJ+1sLJbAFxqHhx
	 XZg+olc+hFAXldS8wAu5gKUj1xbTqJEjYWOmFhfZgQEX6hXZFePYRQVvAGl2GCniWn
	 llny5DGhvzSl99aAxg+F3jymqmwKhSOSDRAmHeRCNulrkDks9Y9Izob3hir9BWgp5R
	 1lrygwAPDE3b+qY+opqZUbIXePVx6WTCwmgNPD/M1yUoVrNG2ui9ScwJjuHW0inzuf
	 lf8wQWFuqiXpQ==
Date: Fri, 10 Nov 2023 09:04:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Joe Perches <joe@perches.com>, Alex Elder <elder@ieee.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Mark
 Brown <broonie@kernel.org>, users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231110090446.479f4cf5@kernel.org>
In-Reply-To: <CAHk-=wgskvYEw3RtsPSkzm=0aQA4hKT2+GOb2u6apcaW=8_i4g@mail.gmail.com>
References: <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
	<ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
	<6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
	<20231108140415.46f84baa@gandalf.local.home>
	<eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
	<20231109092701.GG21616@pendragon.ideasonboard.com>
	<903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>
	<ktmwnywdfziwkngd7exd2rmfzf3ozsws6o3u4hzch3r6ckefvs@a7pehvrsz7ii>
	<7ebbd98a64b581b42a93720896dc104398f5d322.camel@perches.com>
	<20231109-soft-anaconda-of-passion-5157c7@nitro>
	<20231109231633.GI4634@ziepe.ca>
	<CAHk-=wgskvYEw3RtsPSkzm=0aQA4hKT2+GOb2u6apcaW=8_i4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Nov 2023 16:56:33 -0800 Linus Torvalds wrote:
> Developers might even be able to sign up to "virtual" lists, where
> they get cc'd if a patch makes it to that list that has a file pattern
> that matches their "I'm interested in these path patterns".

Yes. Please.

Could we possibly make that work via IMAP, inject the emails into
people's inboxes instead of via STMP? It may break local filtering
and would require that people give k.org passwords / API keys.
But we won't be running into the STMP rate limits any more.


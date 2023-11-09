Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3427E701E
	for <lists@lfdr.de>; Thu,  9 Nov 2023 18:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F91D1C20CA1
	for <lists@lfdr.de>; Thu,  9 Nov 2023 17:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BEA20B34;
	Thu,  9 Nov 2023 17:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vC7q25/+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0B1EC8;
	Thu,  9 Nov 2023 17:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79162C433C8;
	Thu,  9 Nov 2023 17:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699550743;
	bh=byD0TUNcFEisLkZzFJpMbNAJc7N7fewTfu5QubYhp1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vC7q25/+cwGGDX4KDW8nUGDAgD48EV10meVHv0s74uMpucEV/VMVweqy7Dkrf10Ar
	 Nx6lFSmicRFXWNXiTXxCsSFbn8u+dHb0kIM9gu8KbWyZdUhLadYxvDoiS+BPpFXNjZ
	 8GpqSrE7xKRYl9bXzSRsajv4U1nN42o8732xr5BU=
Date: Thu, 9 Nov 2023 12:25:42 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Alex Elder <elder@ieee.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>, users@linux.kernel.org, 
	ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <ktmwnywdfziwkngd7exd2rmfzf3ozsws6o3u4hzch3r6ckefvs@a7pehvrsz7ii>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <20231106110547.6956a430@gandalf.local.home>
 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home>
 <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
 <20231109092701.GG21616@pendragon.ideasonboard.com>
 <903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>

On Thu, Nov 09, 2023 at 11:14:38AM -0600, Alex Elder wrote:
> My input is that whatever the outcome of all this discussion, please
> define it as policy and have get_maintainer.pl implement it.  I don't
> want to have to think too hard about who *should* be included (beyond
> people I already know).

Yes, I fully agree with you -- people shouldn't need to know where the patches
should be going. The tooling should decide this for them, and I want to change
the tooling so that it no longer includes linux-kernel@vger on everything,
only on patches without any other mailing list matches.

-K


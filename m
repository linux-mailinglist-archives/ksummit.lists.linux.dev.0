Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC7C7E6E6C
	for <lists@lfdr.de>; Thu,  9 Nov 2023 17:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2A1AB20C4B
	for <lists@lfdr.de>; Thu,  9 Nov 2023 16:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2FF21A1F;
	Thu,  9 Nov 2023 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8612E21A16;
	Thu,  9 Nov 2023 16:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A53C433C7;
	Thu,  9 Nov 2023 16:16:42 +0000 (UTC)
Date: Thu, 9 Nov 2023 11:16:46 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Joe Perches <joe@perches.com>,
 Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, users@linux.kernel.org,
 ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231109111646.0f18ba0b@gandalf.local.home>
In-Reply-To: <20231109160834.GB6221@pendragon.ideasonboard.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	<20231106110547.6956a430@gandalf.local.home>
	<280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
	<ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
	<6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
	<20231108140415.46f84baa@gandalf.local.home>
	<eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
	<20231109105112.46d65fcd@gandalf.local.home>
	<20231109160834.GB6221@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Nov 2023 18:08:34 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> They won't be seen by most DRM people though, as those people are most
> likely not following LKML due to the amount of e-mails. I barely even
> ever read lists these days due to the mail volume, even for the
> subsystems I'm most involved with :-S

True, but I do get random responses from people that I don't believe are
following the tracing list.

-- Steve


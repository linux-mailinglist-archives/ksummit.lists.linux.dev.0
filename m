Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DA17F35A4
	for <lists@lfdr.de>; Tue, 21 Nov 2023 19:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA78B1C21953
	for <lists@lfdr.de>; Tue, 21 Nov 2023 18:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4356C22092;
	Tue, 21 Nov 2023 18:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fmNuBMOg"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D68020DF4;
	Tue, 21 Nov 2023 18:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF327C433C7;
	Tue, 21 Nov 2023 18:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700590132;
	bh=j2rLv+Wbq2Z8LhtS3KdLLsvOVJ5OVxzhCyjsBNKLqG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmNuBMOgMyEB5LnvPbHDrud147BeiJLyyH5kqCM53R/lE0NmvsjzdrtfyxDigM5H5
	 TGolGoxR2jm7iES+mopNqx7JNvQx9gq2yUyQU3IJXWrUAqBza50xPRgmsudDA+N+Fd
	 KtKtVxMMy9sKjW3RcecEcC16eagB0FoWCsjZKwSc=
Date: Tue, 21 Nov 2023 19:08:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <2023112137-shrubbery-pogo-8fb0@gregkh>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <12ff8c26fd08ce1eec1934f1abc1be72090177c9.camel@perches.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12ff8c26fd08ce1eec1934f1abc1be72090177c9.camel@perches.com>

On Tue, Nov 21, 2023 at 06:53:29AM -0800, Joe Perches wrote:
> On Mon, 2023-11-06 at 10:33 -0500, Konstantin Ryabitsev wrote:
> > For this reason, I propose switching the "F: *" entry in MAINTAINERS 
> > ("THE REST") to patches@lists.linux.dev instead.
> 
> Any agreement on this?

No disagreement from me!

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


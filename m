Return-Path: <ksummit+bounces-1052-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C5783EB8
	for <lists@lfdr.de>; Tue, 22 Aug 2023 13:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59E391C203A8
	for <lists@lfdr.de>; Tue, 22 Aug 2023 11:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797C1125DA;
	Tue, 22 Aug 2023 11:29:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B902A8479
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 11:29:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79609DD9;
	Tue, 22 Aug 2023 13:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692703665;
	bh=At7EADLN/iRPREmKy6BFRH9SCBqwpJptB9m1nEm4nJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/HNNMDUCJvmH/1Bhw2GfJ0I/6Y41Lh4U4P+/dclpF8/OGzyS3Pp9sX4FR9y++J8U
	 NLBipHnrolH1g5gMsLK2YyA8QII5fzrbbFsGecRkWRg5luYlzHaa7fhgWweyzhTaY1
	 BKRSXvkSQmNQSSWm+XE3MDeVd0XcOVVTZxG4RtMg=
Date: Tue, 22 Aug 2023 14:29:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Vegard Nossum <vegard.nossum@oracle.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230822112910.GO10135@pendragon.ideasonboard.com>
References: <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
 <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
 <20230822094613.bxtsjlnkhaypoflj@quack3>
 <20230822-komitee-erreichbar-4dff01dec543@brauner>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230822-komitee-erreichbar-4dff01dec543@brauner>

On Tue, Aug 22, 2023 at 12:10:26PM +0200, Christian Brauner wrote:
> > I agree it is good to create positive incentives to provide good review.
> > But I believe what really makes people do good reviews is the sense of
> > common responsibility - you don't want buggy or misdesigned stuff to get
> > into the subsystem you work with because that's going to make life harder
> > for everybody including you in the future. And I understand the "tragedy of
> 
> Yes, this is a Herculean task and often just results in complaints that
> this is unnecessary non-technical pushback.
> 
> > commons" (IOW selfishness) works against this so incentives or
> > review-trading or other methods can help but ultimately it is IMHO about
> > making people understand and accept this shared responsibility...
> 
> Yes, but in order to encourage and incentivize shared responsibility the
> environment must feel sufficiently safe and have a good model of shared
> ownership. I think we often still have deficits in both (with
> differences between subsystems).

The DRM subsystem has done, as far as I can tell, an good job at
creating a safe and welcoming environment. Dave and Daniel both
indicated they don't have much new to say about the multi-committer
model, but maybe they could have lessons to offer on the human side ?
This is a topic that may be difficult to discuss publicly though, as it
often touches personal stories of abusive behaviour patterns noticed
through various communities.

-- 
Regards,

Laurent Pinchart


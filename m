Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DBC7E3A1A
	for <lists@lfdr.de>; Tue,  7 Nov 2023 11:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF950B20C5D
	for <lists@lfdr.de>; Tue,  7 Nov 2023 10:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C609628E29;
	Tue,  7 Nov 2023 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC9B28FD;
	Tue,  7 Nov 2023 10:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6163AC433C7;
	Tue,  7 Nov 2023 10:42:19 +0000 (UTC)
Date: Tue, 7 Nov 2023 11:42:16 +0100
From: Greg KH <greg@kroah.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Pavel Machek <pavel@ucw.cz>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <2023110701-overstuff-tidiness-10c2@gregkh>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <ZUluOoDjp/awmXtF@duo.ucw.cz>
 <34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>
 <20231107101513.GB27932@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107101513.GB27932@pendragon.ideasonboard.com>

On Tue, Nov 07, 2023 at 12:15:13PM +0200, Laurent Pinchart wrote:
> On Tue, Nov 07, 2023 at 10:18:58AM +0100, Paolo Bonzini wrote:
> > On 11/6/23 23:52, Pavel Machek wrote:
> > >> For this reason, I propose switching the "F: *" entry in MAINTAINERS
> > >> ("THE REST") topatches@lists.linux.dev  instead. This list differs from LKML
> > >> in the following important aspects:
> > >
> > > How many patches are in "the rest" area? I don't think it is that
> > > many, and I believe those should be broadcasted, as it is not clear
> > > who should handle them. And lkml seems to be reasonable place for them
> > > at the moment.
> > 
> > Indeed, I suspect that a lot of the traffic to LKML does not come from 
> > "THE REST", but rather from people using a git-send-email configuration like
> > 
> > 	[sendemail]
> > 	to = linux-kernel@vger.kernel.org
> 
> Do we document this as being a recommended git-send-email configuration
> ? That sounds horrible :-( Documentation/process/submitting-patches.rst
> states
> 
>   linux-kernel@vger.kernel.org should be used by default for all
>   patches, but the volume on that list has caused a number of developers
>   to tune it out.  Please do not spam unrelated lists and unrelated
>   people, though.
> 
> This should be updated, even if for the only reason that the text is
> quite confusing (in my opinion at least, I'm not sure if it means LKML
> should be used for all patches, or shouldn't).
> 
> To give another data point, balancing a bit the replies that expressed
> surprise at Konstantin's point that LKML is generally seen as useless
> for holding actual discussions, I do not follow LKML at all due to the
> amount of mails that are not general discussions. It drowns the useful
> information in noise for me.

I think changing the default so that our tools don't automatically point
to lkml will be the key.  For example, here's what get_maintainer.pl
says to do:

	$ ./scripts/get_maintainer.pl drivers/usb/Kconfig
	Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
	linux-kernel@vger.kernel.org (open list)

Why, when we have a valid mailing list (linux-usb), should lkml also be
involved?  I think this patch changes this, which is a good thing and
should cut down on the overall size over time.

thanks,

greg k-h


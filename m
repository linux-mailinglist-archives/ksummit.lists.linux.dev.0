Return-Path: <ksummit+bounces-149-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF93690AD
	for <lists@lfdr.de>; Fri, 23 Apr 2021 12:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 378BA3E89E3
	for <lists@lfdr.de>; Fri, 23 Apr 2021 10:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3508A2FA5;
	Fri, 23 Apr 2021 10:54:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30FF72
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 10:54:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0B15613F2;
	Fri, 23 Apr 2021 10:54:38 +0000 (UTC)
Date: Fri, 23 Apr 2021 12:54:36 +0200
From: Greg KH <greg@kroah.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Shuah Khan <skhan@linuxfoundation.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIKnbDRUKODfj+iF@kroah.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
 <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
 <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
 <dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
 <20210422115235.0526dabd@gandalf.local.home>
 <20210423095830.684d22c4@coco.lan>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423095830.684d22c4@coco.lan>

On Fri, Apr 23, 2021 at 09:58:30AM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 22 Apr 2021 11:52:35 -0400
> Steven Rostedt <rostedt@goodmis.org> escreveu:
> 
> > On Thu, 22 Apr 2021 08:48:21 -0700
> > James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> > 
> > > On Thu, 2021-04-22 at 08:42 -0700, James Bottomley wrote:
> > > [...]  
> > > >    2. Improving the requirement for bug fixes and large series, like
> > > > cover letters to everyone, adding fixes: tag and clear explanation.    
> > > 
> > > Just on this one, can we get the mailing list to help now we're moving
> > > to a new infrastructure?  I was already thinking of asking if it could
> > > reject email with html parts rather than simply losing it, but perhaps
> > > it could reject threaded submissions where the cover letter isn't
> > > correctly cc'd?  I know that's a big ask because there has to be an
> > > easy way to recognize them (heuristics on the PATCH tag?) and a way to
> > > recognize missing cc's (perhaps simply that someone cc'd on the
> > > threaded [PATCH x/y] reply isn't cc'd on [PATCH 0/y]?)  
> > 
> > Unfortunately, this breaks all quilt users, as quilt does not support this.
> 
> This will also break patch series that touch several subsystems.
> 
> Out of curiosity, I ran my script letting it to place at the cover letter
> maintainers, reviewers and mailing lists, for this patch series:
> 
> 	[PATCH 000/190] Revertion of all of the umn.edu commits
> 	https://lore.kernel.org/lkml/YIJyzkgglMrAzIwh@kroah.com/T/#m087445f69f5dd590b9ad5f4cdd62c2a812956435
> 
> The number of e-mails to be C/c is 221 e-mails! (see enclosed)
> 
> An e-mail like that will almost for sure be ignored by  all mail
> servers[1], as the e-mail will be considered as SPAM.
> 
> [1] Except if the servers would have explicit rules to allow such
>     really big c/c list to be accepted from maintainers, which is
>     risky.
> 
> Looking at the actual e-mail from Greg at lore, the CC list was a lot
> smaller than that:
> 
> Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
>         Linus Torvalds <torvalds@linux-foundation.org>,
>         Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
>         Qiushi Wu <wu000273@umn.edu>, x86@kernel.org,
>         Bjorn Helgaas <bhelgaas@google.com>,
>         "Rafael J. Wysocki" <rjw@rjwysocki.net>,
>         Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
>         Michael Turquette <mturquette@baylibre.com>,
>         Bjorn Andersson <bjorn.andersson@linaro.org>,
>         Linus Walleij <linus.walleij@linaro.org>,
>         Bartosz Golaszewski <bgolaszewski@baylibre.com>,
>         Daniel Vetter <daniel@ffwll.ch>,
>         Jean Delvare <jdelvare@suse.com>,
>         Guenter Roeck <linux@roeck-us.net>,
>         Jiri Kosina <jikos@kernel.org>, Will Deacon <will@kernel.org>,
>         Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
>         Jakub Kicinski <kuba@kernel.org>,
>         "David S. Miller" <davem@davemloft.net>,
>         Johan Hovold <johan@kernel.org>,
>         Jiri Slaby <jirislaby@kernel.org>,
>         Pablo Neira Ayuso <pablo@netfilter.org>,
>         Johannes Berg <johannes@sipsolutions.net>,
>         Takashi Iwai <tiwai@suse.com>
> 
> (Not sure what criteria Greg used to shorten the C/c list)

I looked at the actual maintainers for the whole list of patches and
made a judgement call to slim it down to something "manageable"

In other words, I was forced to do it "by hand" :(

thanks,

greg k-h


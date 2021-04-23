Return-Path: <ksummit+bounces-136-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CCA368D70
	for <lists@lfdr.de>; Fri, 23 Apr 2021 08:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 627E53E75C1
	for <lists@lfdr.de>; Fri, 23 Apr 2021 06:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A25B2FA3;
	Fri, 23 Apr 2021 06:53:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtprelay.hostedemail.com (smtprelay0096.hostedemail.com [216.40.44.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64D270
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 06:53:34 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave07.hostedemail.com (Postfix) with ESMTP id D19E1181D5AAB
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 06:46:40 +0000 (UTC)
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay03.hostedemail.com (Postfix) with ESMTP id D125F837F24A;
	Fri, 23 Apr 2021 06:46:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id AE0C820D75C;
	Fri, 23 Apr 2021 06:46:32 +0000 (UTC)
Message-ID: <6c221d801c5a6834168207b5ccadc76ac432c766.camel@perches.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: Joe Perches <joe@perches.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	 <robherring2@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Leon Romanovsky <leon@kernel.org>,
  James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev, tools@linux.kernel.org
Date: Thu, 22 Apr 2021 23:46:31 -0700
In-Reply-To: <20210423080454.78f4f662@coco.lan>
References: 
	<afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	 <YID5xhy2vv45fnOv@unreal> <20210422112001.22c64fe9@coco.lan>
	 <YIFfXTVMDmHwVmSR@unreal> <20210422092916.556e5e50@gandalf.local.home>
	 <CAL_JsqKS-=shqkLhzKeLHqNPhosGJw5X-fOi+dy1rT3Q_LfBZg@mail.gmail.com>
	 <20210423080454.78f4f662@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.10
X-Stat-Signature: 1apc666e8d56wix4xizysw8ar4pnpwxf
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: AE0C820D75C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19z9rxj/NFpYEhJkTt18towQQaVKevDE2o=
X-HE-Tag: 1619160392-84300

On Fri, 2021-04-23 at 08:04 +0200, Mauro Carvalho Chehab wrote:
> I have a script to automate it, but I had to tweak it while handling
> patches that cross a single subsystem boundaries, using git send-email
> with the c/c list obtained from get_maintainers.pl.
> 
> By default, the script adds all maintainers, reviewers and all mailing
> lists to the cover letter, but that sometimes generate a cover letter
> with 80+ c/c, which will be automatically rejected by anti-spam
> measures and by mail servers.
> 
> So, I played with two different alternatives:
> 
> 1. At the beginning, I changed the script to c/c only the mailing lists,
>    excluding maintainers/reviewers;
> 2. As the feedback was not great, I changed the script to c/c only
>    the maintainers, excluding mailing lists/reviewers. It seems that
>    this worked better.
> 
> I didn't try to play with bcc, as replying to it would not send
> the replies to everyone.
> 
> If you think it is worth, I could submit it to scripts/, but I
> suspect we may need to adjust it to work with all maintainers'
> workflows.

I have a very similar script

A portion of a cc script I use tests whether cc'ing the cover letter
to all listed maintainers of a patch series creates a header of less
than 512 chars and if so cc's all relevant maintainers, otherwise it
just cc's the mailing lists.

(Ingo didn't/doesn't want to receive any emails from me)

$ cat ~/bin/remove_undesirable_emails.sh
grep -vPi "(?:\bIngo\s+Molnar\b)"

$ cat ~/bin/cc.sh
#!/bin/bash

opts="--nogit --nogit-fallback --norolestats"
maint_file=$(mktemp -t XXXXXXXX.cc)

if [[ $(basename $1) =~ ^0000- ]] ; then
    ./scripts/get_maintainer.pl $opts $(dirname $1)/* |  \
	~/bin/remove_undesirable_emails.sh > $maint_file
    count=$(wc -c $maint_file | cut -f1 -d" ")
    if [[ $count -lt 512 ]] ; then
	cat $maint_file
    else
	./scripts/get_maintainer.pl -nom -nor $opts $(dirname $1)/* | \
	    ~/bin/remove_undesirable_emails.sh
    fi

...



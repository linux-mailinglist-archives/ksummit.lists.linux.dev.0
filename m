Return-Path: <ksummit+bounces-145-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id B182D368F38
	for <lists@lfdr.de>; Fri, 23 Apr 2021 11:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id D49061C7C3A
	for <lists@lfdr.de>; Fri, 23 Apr 2021 09:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0C92FA5;
	Fri, 23 Apr 2021 09:12:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D51871
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 09:12:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619169127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K8SIKMPdJk4RbgnDuIIr8u+0oGOPLejzuuDqmyI21eY=;
	b=rZ4FA+G8UjOYP2Gl7TPqt9nwdj/301lKUUK9tEeV8v+sZAt2fhHYvPuHFevGzNSnEE9KY8
	9BlIKPOoD/KZy0zuwChU1kpPbqg1ShT3hJcQ5/9iPy7wQfWZiqgU1w2RXR69i7f5RZ8Nhu
	kjkUTRerTaYHlwHJoaZlgFBZGE/ZMy0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B342BAFF6;
	Fri, 23 Apr 2021 09:12:07 +0000 (UTC)
Date: Fri, 23 Apr 2021 11:12:06 +0200
From: Michal Hocko <mhocko@suse.com>
To: Greg KH <greg@kroah.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIKPZgCc7R1j26Of@dhcp22.suse.cz>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422124023.GD4572@sirena.org.uk>
 <YIFx/iorjncjslob@linux.ibm.com>
 <20210422132339.GF4572@sirena.org.uk>
 <20210422111939.0c555039@gandalf.local.home>
 <YIJmBvtU74D+N2DL@kroah.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIJmBvtU74D+N2DL@kroah.com>

On Fri 23-04-21 08:15:34, Greg KH wrote:
> On Thu, Apr 22, 2021 at 11:19:39AM -0400, Steven Rostedt wrote:
> > On Thu, 22 Apr 2021 14:23:39 +0100
> > Mark Brown <broonie@kernel.org> wrote:
> > 
> > > > For me the most annoying is to get several patches from the middle of a
> > > > series. IMHO, sending at least cover letter to everyone is the bare minimum
> > > > so that people at least can take a look at high level details and request a
> > > > repost.  
> > > 
> > > Yes, the cover letter should always go to everyone.
> > 
> > And that's still the one thing that quilt send-mail does not support :-p
> 
> 'git format-patch --cover-letter' also does not seem to support this, so
> what tool does?

My workflow is to put Cc: in respective patches, git format-patch the
series and then use --cc-cmd=./cc-cmd-only-cover.sh along with git
send-email --compose. It sucks but it is manageable.

$ cat cc-cmd-only-cover.sh
#!/bin/bash

if [[ $1 == *gitsendemail.msg* || $1 == *cover-letter* ]]; then
        grep '<.*@.*>' -h *.patch | sed 's/^.*: //' | sort | uniq
fi
-- 
Michal Hocko
SUSE Labs


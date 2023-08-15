Return-Path: <ksummit+bounces-968-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D0877CBA1
	for <lists@lfdr.de>; Tue, 15 Aug 2023 13:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3659281491
	for <lists@lfdr.de>; Tue, 15 Aug 2023 11:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED851096F;
	Tue, 15 Aug 2023 11:23:40 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4533C1D
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 11:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65765C433C7;
	Tue, 15 Aug 2023 11:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692098618;
	bh=07voTG68uvhBzipUES0br8z99pbaC1xV/pP7047ztXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcPwW2wW38S8kc61lhPO17V+MN2IDavvpoAyOz2YwrqFoUU1iZjbNwH0bDeu0YpC0
	 YU23UncGi9FRW6Snpz2J7OLG7EV8LBTX/6zczCYYRVa+CL4xc8OGBS77QH9XQhkBY/
	 su/uxdhCoJvypuTI19lVWAclE7tNv+S4V97R7EDA=
Date: Tue, 15 Aug 2023 13:23:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jiri Kosina <jkosina@suse.cz>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <2023081515-lake-spotty-6a3a@gregkh>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>

On Tue, Aug 15, 2023 at 12:17:03PM +0200, Vegard Nossum wrote:
> I'll throw in another idea: distros@kernel.org.
> 
> A closed list which will be notified by security@kernel.org once they
> feel patches for a particular issue are ready for testing/consumption by
> distros (and hopefully before the issue is disclosed publicly, if the
> reporter still wishes to do that).
> 
> The members and list rules would be totally up to the security team to
> decide.

As per the lawyers, and government officials we have worked with in the
past, having a closed list for preannouncements like this will be
either:

  - deemed illegal in some countries
  - made to have all "major"[1] Linux users on it.

Neither of which actually will work out at all, the whole
"preannouncement" stuff just is not possible, sorry.  I'm amazed that
other projects have been able to "get away with it" for as long as they
have without either being infiltrated by "the powers that be" or
shutdown yet.

Politics is a rough game, the only way to survive is to not play it for
stuff like this.

So no, "distros@k.o" isn't going to be possible for the LF to host, and
any other group that wants to run such a thing will quickly have these
issues as well, it's amazing that linux-distros has been able to survive
for as long as it has.

greg k-h

[1] "Major" includes most government agencies in most countries.


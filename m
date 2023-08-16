Return-Path: <ksummit+bounces-995-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7572277E44C
	for <lists@lfdr.de>; Wed, 16 Aug 2023 16:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87C5F1C210DC
	for <lists@lfdr.de>; Wed, 16 Aug 2023 14:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5F9134B1;
	Wed, 16 Aug 2023 14:57:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80F710957
	for <ksummit@lists.linux.dev>; Wed, 16 Aug 2023 14:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667D5C433C7;
	Wed, 16 Aug 2023 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692197825;
	bh=w43yVFFAAQoSaKI3sty5WQQz1kLBbF2gNWEKwNyS0oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4A1DFSRcv3H88Ve3UPLlta/iG9qwbIs1LXq8XvrmiFiMlG8xp7ool/GPl7Z3g+Bw
	 Y1ZQln2UkGVo9myYAOCXyTBixaBhHOnTzfVXZ12dwONL9W5GuxzR0ecV0ZAtaZ/+UT
	 gCk3qzVpbaAPxuDW2e05j+UU+kpHZn/2GH5IUgAU=
Date: Wed, 16 Aug 2023 16:57:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <2023081645-brush-oblivion-464d@gregkh>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
 <2023081515-lake-spotty-6a3a@gregkh>
 <20230815084253.7091083e@gandalf.local.home>
 <2023081540-vindicate-caterer-33c6@gregkh>
 <nycvar.YFH.7.76.2308160014330.14207@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2308160014330.14207@cbobk.fhfr.pm>

On Wed, Aug 16, 2023 at 12:17:36AM +0200, Jiri Kosina wrote:
> On Tue, 15 Aug 2023, Greg KH wrote:
> 
> > Why are they not just doing what the huge majority of Linux users doing
> > and taking the "feed of known issues that resolve problems before they
> > are public knowledge" that we provide today for free to them?  Because
> > they somehow think that knowing a specific single bugfix is more special
> > than all of those other bugfixes, which honestly, is just loony.
> 
> If you'd like me to turn this proposal into "What can we do to make sure 
> that most major distros are eventually basing their kernels on -stable" 
> discussion, I'd be happy to do that, but I believe this has been discussed 
> quite extensively already.

It has, and note that no one in the room would be in a real position to
solve the problem (Project Managers and VPs are not usually invited to
the kernel summit.)  Now that many laws are being passed to mandate this
soon, I think the governments might solve this issue for us
automatically :)

thanks,

greg k-h


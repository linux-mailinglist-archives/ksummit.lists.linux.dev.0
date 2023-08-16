Return-Path: <ksummit+bounces-997-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C085677E77E
	for <lists@lfdr.de>; Wed, 16 Aug 2023 19:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0DB61C2116E
	for <lists@lfdr.de>; Wed, 16 Aug 2023 17:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41767171CA;
	Wed, 16 Aug 2023 17:22:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A6610949
	for <ksummit@lists.linux.dev>; Wed, 16 Aug 2023 17:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3CFC433C8;
	Wed, 16 Aug 2023 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692206537;
	bh=RYyqVfaSJvwr/b83BggVPaC4dzXmlRwKPDNrwBkskhI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l6SGZlwPlPVL+iVx20DGg5HUO3fOqxsaa2RExDIed6lM9/WA25Yy9h7nlXKPxcaEK
	 05tzie5d3mfbmHDDFfZER4h2g+3OTvLskW3p1M8IetMHY1jq6+FWCrqf5b+NYHnz9p
	 +EakmIRQddr1oS9ZuTadVDrG5QUus17rY/XoILvhormxQ55qdlVNyArI9fOCdGnf1A
	 PtaBcm77Xhj9+EwsTAwWk0RDTJzlrfRHF7N8hThLrnnfUQMHreb3HB0Up65x8bTCP6
	 pz4IVlZnqWSWxDd/XoU7HubwI7kYjr8LYHmpIGhXFw2uYjZCSGWbxXOYwwWoueo1uH
	 Jol7kW9ukNA2A==
Date: Wed, 16 Aug 2023 19:22:14 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Steven Rostedt <rostedt@goodmis.org>, 
    Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
In-Reply-To: <2023081645-brush-oblivion-464d@gregkh>
Message-ID: <nycvar.YFH.7.76.2308161920120.14207@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm> <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com> <2023081515-lake-spotty-6a3a@gregkh> <20230815084253.7091083e@gandalf.local.home> <2023081540-vindicate-caterer-33c6@gregkh>
 <nycvar.YFH.7.76.2308160014330.14207@cbobk.fhfr.pm> <2023081645-brush-oblivion-464d@gregkh>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Aug 2023, Greg KH wrote:

> > > Why are they not just doing what the huge majority of Linux users doing
> > > and taking the "feed of known issues that resolve problems before they
> > > are public knowledge" that we provide today for free to them?  Because
> > > they somehow think that knowing a specific single bugfix is more special
> > > than all of those other bugfixes, which honestly, is just loony.
> > 
> > If you'd like me to turn this proposal into "What can we do to make sure 
> > that most major distros are eventually basing their kernels on -stable" 
> > discussion, I'd be happy to do that, but I believe this has been discussed 
> > quite extensively already.
> 
> It has, and note that no one in the room would be in a real position to
> solve the problem (Project Managers and VPs are not usually invited to
> the kernel summit.)  

Not sure about other distros, but at least at SUSE, this decision powers 
are held by the kernel developers / maintainers of the branches in 
question.

Thanks,

-- 
Jiri Kosina
SUSE Labs



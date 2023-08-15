Return-Path: <ksummit+bounces-987-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC22477D3B7
	for <lists@lfdr.de>; Tue, 15 Aug 2023 21:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2761C20DB8
	for <lists@lfdr.de>; Tue, 15 Aug 2023 19:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2637E18AF2;
	Tue, 15 Aug 2023 19:57:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543671426C
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 19:57:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id E900932007F9;
	Tue, 15 Aug 2023 15:57:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 15 Aug 2023 15:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1692129469; x=1692215869; bh=llWSFyY4FKigvI3OA/KlYbYmq2DOzK4yUku
	+lcZnzVU=; b=C2hUprnLvsOvs1YPwXuFNFBCAtZETTOVwG8/RsnZpw5GjPGUSHV
	VpILBiWpfETWY8M+EQU+C1Rck7JFXuuXAeMjmAz4tR1b13W8M4KpKuc9wvqGnpqz
	aq5vTw6YRTxfj1kG6qWOQ/F+V8e24Xoogql8KnG34EC17ARTPcnCVxTy8lilGTDO
	/OjV7RWreyeLBZ98MGKdgq7ae++vSfOezelolmZuZIK7204VeNQ3so9IkBVoRh7m
	W6RknhYj6D2nZsQOkqqiMaWGfsI8jfyBWoglR50jMMod3Waf8EDLL7ecGNGzlvpj
	NeUhLSzF0SrZKM7xK6E9PKPMIAb6kTSftVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1692129469; x=1692215869; bh=llWSFyY4FKigvI3OA/KlYbYmq2DOzK4yUku
	+lcZnzVU=; b=OaZfEpqSbbp19AdOXavMIdBr+8kNHR7bkjnll0PEr9bu9GgaiKP
	geOkysHstu+7RYE9/3juyHEzTFErd6DJhxMgqWdwfhcCPHEbFpFvId76rhyeaEVu
	6X9YTkSboJ2O7FNRdaGP+TSyQr6t6MervpNJ2jFM+JfXBzraIHRtAAQTV4WJdB/A
	xqEyXkgkBJrrnnkncK9lrurYdLb/xEnH+JZ7MUJfStmla9Y6yInFbxV6MpvHjPyH
	smSvGSQMhdmR9j3Wy7FKi34FWn3f8yPiDbCJ8cNyY2GfcESq6oA4wgVGylPl25BQ
	eqQh1gxXiN60mcL5bZiL1PmsrsWuYYF8EFA==
X-ME-Sender: <xms:vdjbZDDhIfe4rEPnKTczOX6NHQEaVVh-QcH_Zl1mqEz3Wxk7HAav2A>
    <xme:vdjbZJgd9CkbQdsh7ha02TFchrN-6aC4FpzYNoNaEyxJjNtpnP4UVye-G3RJ8X553
    h2WKVEKt1jy5Q>
X-ME-Received: <xmr:vdjbZOmBBz8xB7FDkkvWSu5SPyvYI1v7kNxOwaHucm9wPHx8bCiVFpfh1cJoHDgOJLER0737d3cfrkh3mIiRLgYS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtjedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepifhr
    vghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepge
    evveetgfevjeffffevleeuhfejfeegueevfeetudejudefudetjedttdehueffnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:vdjbZFwSmaqzsoB6n7QUXHXXQGzkDPoKZnhVSxhMM8bcQsWZczGZNQ>
    <xmx:vdjbZIQ9vxrzbG6QtuKBIry_2JcQHFxyJQ8L2u6GOGY6xFbWpWkt4A>
    <xmx:vdjbZIZlSOMJ3xwg17qTrojnVXzhhpkognhgBH5FYd8s5YsfvHDL3Q>
    <xmx:vdjbZOOc92SRQeQSKFPSa_GeEV1lugwR-y0tc_QI58X60A9JQ7rGrA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Aug 2023 15:57:48 -0400 (EDT)
Date: Tue, 15 Aug 2023 21:57:46 +0200
From: Greg KH <greg@kroah.com>
To: Dave Hansen <dave@sr71.net>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Quality standards for embargoed code
Message-ID: <2023081510-monument-sagging-2125@gregkh>
References: <ZNuuvS5BtmjcazIv@sashalap>
 <53f0072b-91c0-0136-a689-f31e8508a862@sr71.net>
 <ZNvBomFMyZTYm7ye@sashalap>
 <e4d1bf8f-cbb5-935d-1a55-7650dff591ab@sr71.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4d1bf8f-cbb5-935d-1a55-7650dff591ab@sr71.net>

On Tue, Aug 15, 2023 at 11:34:37AM -0700, Dave Hansen wrote:
> On 8/15/23 11:19, Sasha Levin wrote:
> > On Tue, Aug 15, 2023 at 10:19:21AM -0700, Dave Hansen wrote:
> >> On 8/15/23 09:58, Sasha Levin wrote:
> ...>>> 1. Ask (require) organizations that repeatedly go through this
> mechanism
> >>> to create a test environment that can demonstrate how the embargoed code
> >>> passes different build/validation tests. We should set a minimal bar to
> >>> the demonstrated quality of code that we'll "sneak" behind the backs of
> >>> community members.
> >>
> >> Intel does send things through 0day internally, with a few minor
> >> differences from how public stuff gets tested.  But, I don't think any
> >> information about that internal testing ever makes it into the material
> >> that get merged.  We'll fix that.
> > 
> > Beyond running tests, it would also be great to standardize on what we
> > need to run, and if Intel wants to start the discussion by openning up
> > it's tests for embargoed code then it'll e a great start!
> 
> I'll go rattle some cages.  It might be boring old 0day, but I'll find out.
> 
> >>> 2. Create a group of trusted "testers" who can test embargoed code with
> >>> different (ideally "real") workloads and environments. I think that
> >>> we're overly focused on keeping the circle of people in the know small.
> >>
> >> The docs:
> >>
> >>> https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
> >>
> >> _should_ allow the "hardware security team" to add testers today:
> > 
> > It probably does, but the way it's written now you'd need a lawyer to
> > confirm that.
> 
> How about something like the attached patch for that doc?  Does that
> help ensure we leave the lawyers alone? :)

The "trick" here is that lawyers agreed with the original wording,
changing it without also getting their approval might be tough :(

Anyway, the main reason we have NOT added testers (nor allowed
developers to use the test systems from their employer) is that those
test systems are able to be accessed by a huge/unknown number of other
people, none of who should have access to the potential changes under
development.

If that can be solved, with a "private" kernelci/lkft/openssf/whatever
test instance, that would be wonderful.  Ideally it should be the
responsibility of the hardware vendor for which we are fixing their
broken hardware with kernel changes to provide this for us.

I know that Linaro has made some lkft access available to some of us in
the past with "private" test systems, but that was a long time ago and I
don't think I have access to that anymore with their most recent rewrite
of their backend.  Oh, and their systems primarily test ARM cpus, of
which we generally do NOT use the embargoed-hw system because those CPUs
usually don't have these types of problems :)

So if we do get access to private testing systems, that do not leak
information to non-members of the group, be it however, I see no reason
why the current wording of the document would not be applicable as we
are allowed to do so:

	The initial response team can bring in further developers
	(domain experts) to address the issue in the best technical way.

And testing is the best technical way to ensure fixes are correct :)

thanks,

greg k-h


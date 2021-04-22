Return-Path: <ksummit+bounces-112-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D5A368558
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 7CEE53E81AD
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09FE2FA0;
	Thu, 22 Apr 2021 16:57:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5071
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 16:57:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BB686101D;
	Thu, 22 Apr 2021 16:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619110661;
	bh=6UJJMMqnYGzBjsejkVAsEZ6S3lwwID2ZQxN4VWAv2tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9WIRHriaFO6m0dNZVqWp8hzpzE0pw7qj/isYtmqtZAr4Wp3ZS2yU5/vkdGCMdhnT
	 esYcMiPw3qzRpX/i0XcfaTx+7/VZwqZFuqtzoaV/N03FocS+9RbAEI8zPbdUkVLU8p
	 ovklYWF15v4KrEWt6sjdNwHrQ7KePCgCD5g7WbiNY0qTz0mS13dLfDETC2ZjHoxvfM
	 0ll1Pb2fl/DKYqfpX2FzaVVj55qVGZQvAJSjIEC8O7THvOQWyHCPh08JpzqSEjMzCT
	 kpBXSTv50rRn04cmKFTuPNQYyzLNyw91o6gDv58+D7heUbuX+LO/K+eFfPXtSTs/oM
	 mIKrDMDz3KjMA==
Date: Thu, 22 Apr 2021 19:57:37 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIGrARwxYtkmWJhH@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
 <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
 <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
 <f3c4cb63-f0f7-97be-227a-7a1a0db34650@acm.org>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3c4cb63-f0f7-97be-227a-7a1a0db34650@acm.org>

On Thu, Apr 22, 2021 at 09:38:32AM -0700, Bart Van Assche wrote:
> On 4/22/21 8:42 AM, James Bottomley wrote:
> >    3. Better handling of "trivial" changes, say via a resurrected trivial
> >       tree
> 
> Why was the trivial tree introduced? I may be missing some history here.
> 
> I'm not convinced that sending trivial patches to a separate mailing
> list and maintainer helps everyone. As an example, I want to see block
> layer patches being posted on the block layer mailing list and I want to
> see SCSI patches being posted on the SCSI mailing list. I don't want to
> have to follow a separate "trivial" mailing list to verify whether or
> not e.g. a patch is posted on that mailing list that changes a correct
> comment into an incorrect comment.

Completely agree, the idea that trivial.git patches don't need review of
relevant maintainer sounds wrong to me. And if the maintainer looks on
them, he/she can apply them directly.

Thanks

> 
> Thanks,
> 
> Bart.
> 


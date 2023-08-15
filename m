Return-Path: <ksummit+bounces-992-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF1877D5D7
	for <lists@lfdr.de>; Wed, 16 Aug 2023 00:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89D712815E8
	for <lists@lfdr.de>; Tue, 15 Aug 2023 22:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BFF198A3;
	Tue, 15 Aug 2023 22:17:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE1B15AD7
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 22:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC53C433C8;
	Tue, 15 Aug 2023 22:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692137859;
	bh=v7rA4VRko6Q8PUn/6yx1WKGOmiBAZz/YLPNwUjwNxQU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BnaFTsJdxZyOQctrjhv+ZyGoI0SPqu+ipG0dRZ9Jw5v8Zsy/k0Q+dS9uAZ84el/z7
	 piyz9ZmNbbbB71xY5d28oOOO4lfhwXioN1erwrn36QTzj4chhOVB55Y7KzXJfFqHB6
	 qxgd3+PRzmbDq5JfiPlpcWzrBpTy/ft9cdA/l9c9pAK3ZH+hDCpRc1iC88OmvhnITy
	 32bZWE9Xd/XfM1ObrAgVUqGlrm8MOov3mMu9NcKJ/DE2T2xgDG230kVEa3yr63qFSg
	 8LoR5n77D7uf+owqicF8Y8PQsbZ8Yrl4X/lQu2kIEf9QCPSUz50A0BjAgiFhN2x7nz
	 bXhux89PkJBwQ==
Date: Wed, 16 Aug 2023 00:17:36 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Steven Rostedt <rostedt@goodmis.org>, 
    Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
In-Reply-To: <2023081540-vindicate-caterer-33c6@gregkh>
Message-ID: <nycvar.YFH.7.76.2308160014330.14207@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm> <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com> <2023081515-lake-spotty-6a3a@gregkh> <20230815084253.7091083e@gandalf.local.home> <2023081540-vindicate-caterer-33c6@gregkh>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Aug 2023, Greg KH wrote:

> Why are they not just doing what the huge majority of Linux users doing
> and taking the "feed of known issues that resolve problems before they
> are public knowledge" that we provide today for free to them?  Because
> they somehow think that knowing a specific single bugfix is more special
> than all of those other bugfixes, which honestly, is just loony.

If you'd like me to turn this proposal into "What can we do to make sure 
that most major distros are eventually basing their kernels on -stable" 
discussion, I'd be happy to do that, but I believe this has been discussed 
quite extensively already.

Thanks,

-- 
Jiri Kosina
SUSE Labs



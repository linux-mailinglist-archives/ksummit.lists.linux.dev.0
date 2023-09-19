Return-Path: <ksummit+bounces-1165-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A744B7A6A48
	for <lists@lfdr.de>; Tue, 19 Sep 2023 19:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C80E281894
	for <lists@lfdr.de>; Tue, 19 Sep 2023 17:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA41A38DD9;
	Tue, 19 Sep 2023 17:54:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81859347B9
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 17:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1695146091;
	bh=u3bd5tB3uTJv5tvs4sa03J8CBoBuWdW4HotSTNcb61k=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=hugujYZDSafKGgSiDGU83eGKpeO0oP5kw9sVIbCWODqiAnLcJKXyh/5iVUWwXxH8j
	 kvu9pCwCkTAhIYqt7xtTmqjHPKIO7Er2rWksLLDcHHtCPBYfM+hVplQvD2nf7wofoH
	 dfNdh5RTUKFAz1ixBvuCTAFg7SPjEMeZFVgInAvc=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 701C112866C9;
	Tue, 19 Sep 2023 13:54:51 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id CdgLnba_HMW3; Tue, 19 Sep 2023 13:54:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1695146091;
	bh=u3bd5tB3uTJv5tvs4sa03J8CBoBuWdW4HotSTNcb61k=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=hugujYZDSafKGgSiDGU83eGKpeO0oP5kw9sVIbCWODqiAnLcJKXyh/5iVUWwXxH8j
	 kvu9pCwCkTAhIYqt7xtTmqjHPKIO7Er2rWksLLDcHHtCPBYfM+hVplQvD2nf7wofoH
	 dfNdh5RTUKFAz1ixBvuCTAFg7SPjEMeZFVgInAvc=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id CCDBA1286254;
	Tue, 19 Sep 2023 13:54:50 -0400 (EDT)
Message-ID: <f5b4f69056a5ec104fc58e55137912495caf11d4.camel@HansenPartnership.com>
Subject: Re: [Tech-board-discuss] [MAINTAINERS SUMMIT] Maintainers Support
 Group
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Shuah <shuah@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	ksummit@lists.linux.dev, tech-board-discuss@lists.linux-foundation.org
Date: Tue, 19 Sep 2023 13:54:49 -0400
In-Reply-To: <371cb5d1-9997-a03b-4848-550ac8658021@kernel.org>
References: <20230919121001.7bc610d4@gandalf.local.home>
	 <371cb5d1-9997-a03b-4848-550ac8658021@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2023-09-19 at 10:52 -0600, Shuah wrote:
> Hi Steve,
> 
> On 9/19/23 10:10, Steven Rostedt wrote:
> > There has been several topics brought up already about maintainer
> > burnout.  A while back, I was talking with another maintainer that
> > basically told me that they were ready to quit being a maintainer
> > because it's not fun anymore. There's a lot of requirements and
> > basically have to deal with crap from submitters. The Code of
> > Conduct has been successful in helping to keep a more civil
> > environment, but all the focus has mainly been around telling
> > maintainers how to behave.
> 
> As a member of the CoC, I respectfully disagree with the statement
> "but all the focus has mainly been around telling maintainers how to
> behave." This impression might have been the result of one
> unfortunate incident that took place last year. is only part of what
> CoC has been doing.

If it helps, I proposed a more generic version of a maintainer stress
session here:

https://lore.kernel.org/ksummit/ab9cfd857e32635f626a906410ad95877a22f0db.camel@HansenPartnership.com/

It doesn't mention the code of conduct at all.  I really think
focussing on stress coping rather than pointing fingers at the alleged
stress inducers would be the way to move forwards on this.  Although it
might be helpful to have a non judgmental listening session about what
everyone thinks the major stress inducers are.

James





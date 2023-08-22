Return-Path: <ksummit+bounces-1047-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41543783DA1
	for <lists@lfdr.de>; Tue, 22 Aug 2023 12:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E58A1281007
	for <lists@lfdr.de>; Tue, 22 Aug 2023 10:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F9F9455;
	Tue, 22 Aug 2023 10:10:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB9D29A0
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 10:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386B7C433C7;
	Tue, 22 Aug 2023 10:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692699032;
	bh=gYwCwCuz/Frh9r5e+ITLpjfScN9KYqIJWhVd8xhGsUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2ToQSjb2TZCEcJU4EreTAu6+XkfXa8s/WgErDHdZCBnDdxm+d0ffz5g4WVYzC8V3
	 q7VAPq6Fffz28IBIMyvPYiH2oCzG3VLW8uZrRmYGsndcttxf+n55N5fboKM0oYtfrV
	 U/solIx8Wwhmpo3LaqMw6G9YVg3ccbCaaIj7BHVNRYUX6QmOrfCfZTL/xAvediF01G
	 qK5l3mHvOFuzKnffJRMAwxMQq9mA09HuqhnU9pqea3nWYA5j3IjgC0VHrN0JF7M5Kv
	 GvNfmsfi7hgDdN/0mDbNMrFDS24DEtcw8wf8itnGZAwHYMx2WpGehA67bNJ+BKejCY
	 stUIXZccqeEKA==
Date: Tue, 22 Aug 2023 12:10:26 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Vegard Nossum <vegard.nossum@oracle.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230822-komitee-erreichbar-4dff01dec543@brauner>
References: <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
 <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
 <20230822094613.bxtsjlnkhaypoflj@quack3>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230822094613.bxtsjlnkhaypoflj@quack3>

> I agree it is good to create positive incentives to provide good review.
> But I believe what really makes people do good reviews is the sense of
> common responsibility - you don't want buggy or misdesigned stuff to get
> into the subsystem you work with because that's going to make life harder
> for everybody including you in the future. And I understand the "tragedy of

Yes, this is a Herculean task and often just results in complaints that
this is unnecessary non-technical pushback.

> commons" (IOW selfishness) works against this so incentives or
> review-trading or other methods can help but ultimately it is IMHO about
> making people understand and accept this shared responsibility...

Yes, but in order to encourage and incentivize shared responsibility the
environment must feel sufficiently safe and have a good model of shared
ownership. I think we often still have deficits in both (with
differences between subsystems).


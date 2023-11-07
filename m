Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD67E3F1E
	for <lists@lfdr.de>; Tue,  7 Nov 2023 13:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0086A28109A
	for <lists@lfdr.de>; Tue,  7 Nov 2023 12:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF2E171DB;
	Tue,  7 Nov 2023 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="R2dC4ySQ"
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A4E10A25
	for <ksummit@lists.linux.dev>; Tue,  7 Nov 2023 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2BX+KmxhkszJNHijTBxvvqONjDFjtaupwGxQsBUVokM=;
  b=R2dC4ySQM8/ys4cFVcqjGAHMrDsYaoPL4WwuW7quwWDEZR/om8EHvAqN
   zjqZmkzR3qEN4Bh+bLc/xd1uSQiu66Y24HPcMnuJEjBo6sC1MQYd2LQnS
   OPxOPCRIKeCBnB/5sSI62IohDKRcnuMBQs8Vdz8rlbdbVXrY5EGH6nJ4o
   g=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,283,1694728800"; 
   d="scan'208";a="135032720"
Received: from 71-219-23-58.chvl.qwest.net (HELO hadrien) ([71.219.23.58])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 13:47:27 +0100
Date: Tue, 7 Nov 2023 07:47:23 -0500 (EST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Pratyush Yadav <pratyush@kernel.org>
cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, Pavel Machek <pavel@ucw.cz>, 
    Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
    users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
In-Reply-To: <mafs0o7g5hiba.fsf_-_@kernel.org>
Message-ID: <b36d7b18-2092-1848-e22a-7e34588db0f5@inria.fr>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro> <ZUluOoDjp/awmXtF@duo.ucw.cz> <34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com> <20231107101513.GB27932@pendragon.ideasonboard.com> <mafs0o7g5hiba.fsf_-_@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

At various times, I have wanted to see the discussion that led up to a
commit, and LKML was the obvious place to go for that.  What will be the
approach to take in the future?

thanks,
julia


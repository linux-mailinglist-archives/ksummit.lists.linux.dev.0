Return-Path: <ksummit+bounces-2079-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0535B1BC33
	for <lists@lfdr.de>; Tue,  5 Aug 2025 23:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D292E7A85E3
	for <lists@lfdr.de>; Tue,  5 Aug 2025 21:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77B7299944;
	Tue,  5 Aug 2025 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLNy+pBn"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDAB25A357
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754430790; cv=none; b=o3WH97aJTYwHmq7lHzisafZB8nP8py4ICPpY1clYYFR+2OItdSDgjF3pOAr/rrLhENe8y318ElYW7LtDfc/dJeh5GP/WDQqjiHhJ1QzvNK+rbYa5sC5QKtdJZ43ZZnsv4M1rsVrj4+cwwt3bovB7Mb1zxdSbKNWEakVTiQ/YpxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754430790; c=relaxed/simple;
	bh=Mlisgtuy47R4JtgUOyJhpuaotZVI3gGJYXwFdlvL3wg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ex1txTWkzTyYTnfhjznm1pHTdy5ClnZZo+rUKdj1mewuMAWo8uqfz9WBNrUy2nIhkj6MoO8y5wLvlMphnZ4IWmQkEYEEJApIYY+WB4/iWTVzI2CcZEHrn6JIbRxDi2NLU4wFkLi6i8MNPbBGsYXlQIhIUMg9mtd2kkRg7+q8swo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLNy+pBn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C098C4CEF0;
	Tue,  5 Aug 2025 21:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754430790;
	bh=Mlisgtuy47R4JtgUOyJhpuaotZVI3gGJYXwFdlvL3wg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OLNy+pBn60rKiiKIM3TR0jIRJFK+on+ctmerztpIhS3ZVPKkuRZwFIX2B89ohFINb
	 eVVYyc6GSHdXAbjIUIZry0aBp0sqSmHUxzLuyy2ivlRh+24HBOm/LCE2/uC2FCp71I
	 SZpnjFjs28vrkmvQ+VJRDzD63ghHC6aJ0+TVcSLSUiCmYNhEQ1Uej2GdJcA3mvYGo6
	 3E4V9W8r9/zAn80yfzhg/vTN1EfFSY6aUgpGT6MBaYMOXDTVl4pFeiOs9iaZlZ5NtF
	 daqWShNed5DDx8sX2HCzJvpHJZtSLn329N/wkQBpx1JeMJF0unZkAnwqjDNiY0QJbi
	 SYOm/BO6GC+1g==
Date: Tue, 5 Aug 2025 23:53:07 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Sasha Levin <sashal@kernel.org>
cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
In-Reply-To: <aJJKccsn_L0hGXoA@lappy>
Message-ID: <nr535n6s-qoor-q377-591s-85no07s5n8q5@xreary.bet>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz> <aJJEgVFXg4PRODEA@lappy> <20250805180010.GA24856@pendragon.ideasonboard.com> <aJJKccsn_L0hGXoA@lappy>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Aug 2025, Sasha Levin wrote:

> In the context of this discussion it's a bit funny: we mandate that
> reviews will be responded to, but we don't mandate that the response
> will make any sense, which I think is Jiri's point.

Yeah, indeed, pretty much.

> The TIP maintainer's handbook (maintainer-tip.rst) actually seems to
> tackle this:
> 
>    SOBs after the author SOB are from people handling and transporting
>    the patch, but were not involved in development. SOB chains should
>    reflect the **real** route a patch took as it was propagated to us,
>    with the first SOB entry signalling primary authorship of a single
>    author.
> 
> Should we clarify that this is true for any kernel patches?

It also seems to handle Co-developed-by: in a nice way a few lines above.

I think both of these shouldn't really be specific to tip.git 
documentation, and should be made general.

With this in place (and with the additional requirement of documenting 
that the code/patch has been LLM-assisted), I believe this specific part 
of the problem should be mostly covered.

Thanks,

-- 
Jiri Kosina
SUSE Labs



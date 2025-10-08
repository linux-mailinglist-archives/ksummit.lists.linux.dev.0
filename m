Return-Path: <ksummit+bounces-2443-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F246BC6962
	for <lists@lfdr.de>; Wed, 08 Oct 2025 22:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0613B34B1E7
	for <lists@lfdr.de>; Wed,  8 Oct 2025 20:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EEA299AAB;
	Wed,  8 Oct 2025 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="aApEhJY5"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B561E4C6C
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 20:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759955358; cv=none; b=bs+OFNMAjR5G10NaKil6Cd0KaVc4AIsCDtMQ70E3Et1wtX4MN9rNyJ9O7MD+fCE5nlYTZN/fmC5RH5I1NhSL5SKLpNJ/tOo7I5ZYThXDBxcrZpjJ2sPJy3v6Nc+AwFmmfNN5ERQXdTX3nzdhtIdUkLWdVa5B92tFT3xq6IGCGac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759955358; c=relaxed/simple;
	bh=yru6V6tdGN05E8j9ND6jzUv/dpuAmYwLS9RpyQzjKXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YG1xmkJNp2Eaojno3VaJfmH/0OhjP4ogq2jTvhQqhEdwhEhDIWliOQTGdqMveOUWsDMOMQi6xDsbjZKRyDJQiUmaHjXoFSdisZmHHQ8ZFA1fNhniPARUFB0lJns4SuhItwgng4TomzLJbDc/7DNzEWWVMUhyRglxDwvCAKN1Imw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=aApEhJY5; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Nt1/9LUKNaucC9oIWZISN8Dga9Qt+CfwZSUtYFoUZ48=; b=aApEhJY5nOcgmjeLL07nTErmF3
	0npwAhs+mamagyiEGM2WrOVigJ6rk8AnKPxiXlSiPI1NFj5OXmjSw0lbOrcLBciVkf0XXfOJ2zcHa
	2j+6wQAh4ertaW68SySi9C/DIV0138C7N04pnvhNTdG00kLKsDep1Arc7wnVGxmrs3qg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6amd-00ATdo-5u; Wed, 08 Oct 2025 22:29:11 +0200
Date: Wed, 8 Oct 2025 22:29:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chris Mason <clm@meta.com>, ksummit@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <64f6eab8-1f0a-42e2-835f-a548d2fd6df5@lunn.ch>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <aOa7Tn0QbXwL-Ydo@x1>
 <20251008193349.GI16422@pendragon.ideasonboard.com>
 <aOa95ZFLXgaEh5PJ@x1>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOa95ZFLXgaEh5PJ@x1>

> I think maintainers can't take anything for sure, even when dealing with
> contributors that posted tons of patches before :-/
> 
> And as you said, we can't count on contributors running existing tests,
> or using things like linters, checkpatch, you name it, let alone AI
> assistants.

I agree. Maintainers run these tests as well just to confirm the
developer has run the test. And Maintainers probably take less notice
of the output, and look more at the passed/failed exist status. Why it
failed is generally not too important, the fact it failed just needs
to be bounced back to the submitter so they can investigate and fix
the issue.

But this also requires these tests are reproducible, and that is one
question i have. checkpatch, sparse, kdoc, Coccinelle are all
reproducible. They give the same answer every time. If it passes for
the developer, it should also pass for the Maintainer. But is this
true of AI tools? Are they reproducible?

   Andrew


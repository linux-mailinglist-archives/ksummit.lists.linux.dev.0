Return-Path: <ksummit+bounces-2026-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAD4A4AB2D
	for <lists@lfdr.de>; Sat,  1 Mar 2025 14:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297FF16E783
	for <lists@lfdr.de>; Sat,  1 Mar 2025 13:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220E71DED72;
	Sat,  1 Mar 2025 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="fBPIVP7j"
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2744F23F36F
	for <ksummit@lists.linux.dev>; Sat,  1 Mar 2025 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740835364; cv=pass; b=NvlzErn2GF5SHsAHjxBDf616ONxuw6g57ag/GfeUrXHIYcoSx+qA6vP4iCIJ4WhU2AyNA72ZoItJIk+1QHgUycTEbGlBdxY1Qv9BJBAmCLAepq8xSFEmglNXvpYxBm7Pw1KYSUaTO8mlocVBt6fE4Ho9u1z085ZAvFDFew7tsfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740835364; c=relaxed/simple;
	bh=kmbLST3B8l0hqe9GENyoXR0gvr550yOwf3BicKoSaRI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G09NU1WLRPd9azI04Ah8u6aryT7/ctlAoddnvleqEYj4Qenwijov2VgTszH6VmQFznzgzjRZWlNhtnhQmON05uLWgbmj8fZ8K/PuJ99XakIvb8PmRm6xloEIk4aX2BX/oODcfj7ecmPVPLoyFcalrTQBOIPTkch99bftUK1QwR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b=fBPIVP7j; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1740835359; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DyGYgAA9r+gh65F1jDw/kd6i10I6ZI7zLXjXapQeoL3h2qCEuW08+I10ZETBUG0p4F8U5u1u6bkzpBU9+m9xGuHmC/sxT1pUiwmMTD6UeHwMTeXnavKeNf7IYiBi8kusqI8dGqh36HXueuOAuPHJ5FEHTjDWkA4UnURGGLXXyK8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740835359; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QEcFFAxfF3kvhNHl30onzxCesolmRPddXa5t/GhIDeo=; 
	b=i1wCLMoaEflVnz3aN4XCVSqvkJzLBDVY2MDQeD8B70YoV5lwF1PvHgaea/pS3mpTYa9bHa1RgvxrVn5e/UBs2SZezhE+vYkTBDaSmp7Sr2sNGmcDLdieC4rErUQDXiHF/NVDqdOrzF9Ry2oRmhUNSN7BSBG72j50crtE16qlfAg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740835359;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
	bh=QEcFFAxfF3kvhNHl30onzxCesolmRPddXa5t/GhIDeo=;
	b=fBPIVP7jnUtgIL+9m++gSejGk+MW12beyjlgMRsnsY+dE/eyLKiCMI/BXbJt1HtT
	WaPZxey19meiC7oFRvD8klz0sZHU1z8X70GpPG9yIINJKfNuy0iFQyScjbmMkJaksUP
	yaju1DluJoGPZenbFJLWUhS4Xy0zdxOjVrT+oLCE=
Received: by mx.zohomail.com with SMTPS id 1740835355747738.2807174501816;
	Sat, 1 Mar 2025 05:22:35 -0800 (PST)
From: Askar Safin <safinaskar@zohomail.com>
To: uecker@tugraz.at,
	dan.carpenter@linaro.org
Cc: airlied@gmail.com,
	boqun.feng@gmail.com,
	gregkh@linuxfoundation.org,
	hch@infradead.org,
	hpa@zytor.com,
	ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	rust-for-linux@vger.kernel.org,
	torvalds@linux-foundation.org
Subject: Re: Rust kernel policy
Date: Sat,  1 Mar 2025 16:22:29 +0300
Message-Id: <20250301132229.3115698-1-safinaskar@zohomail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
References: <61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227d3f563c35efbb5d496057d920000f1ec4ce021640ea1b87657279fa549649710fe5cfa1eb332eb:zu080112270ea6dcf8350928bbb567b6af00005e2f2d536712854d902d7af778adf91d6c3919efd38df7dd98:rf0801122ccb5ccc2d4433bfc49c9c7ce20000c2e34ae1f49168ead396ae91ea6985b023a27386bb9cf2fbf0babb6c5a34:ZohoMail
X-ZohoMailClient: External

Hi, Martin Uecker and Dan Carpenter.

> No, this absolutely is useful.  This is what UBSan does now

> BTW: Another option I am investigating it to have UBsan insert traps
> into the code and then have the compiler emit a warning only when

Clang sanitizers should not be enabled in production.
See https://www.openwall.com/lists/oss-security/2016/02/17/9 for details

